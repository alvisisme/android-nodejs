# build nodejs for android
编译Node为Android　arm64架构下的可执行文件和动态库．

## 测试环境
* ubuntu16.04(docker)
* android ndk r13b
* node v6.10.0

## 编译步骤
* 搭建docker编译环境
  ```shell
  docker build -t build-nodejs-for-android .
  ```
* 进入docker编译环境
  ```shell
  docker run -it -v `pwd`:/home/dev/out build-nodejs-for-android
  ```
* 下载Node
　```shell
  git clone --branch v6.10.0 --depth 1 https://github.com/nodejs/node.git
  ```
* 编译可执行文件
  ```shell
  cd /home/dev/node
  ./configure --prefix=/home/dev/out --dest-cpu=arm64 --dest-os=android --cross-compiling --without-snapshot --without-inspector --without-intl
  make -j4
  ```
* 编译动态库
  ```shell
  cd /home/dev
  git clone https://github.com/alvisisme/build-nodejs-for-android.git
  cp build-nodejs-for-android/node_v6.10.0.patch node/node.patch
  cd /home/dev/node
  patch -p1 <node.patch
  ./configure --prefix=/home/dev/out --dest-cpu=arm64 --dest-os=android --cross-compiling --shared --without-snapshot --without-inspector --without-intl 
	make -j4
  ```
 
## 问题记录
* 编译动态库时需要将**deps/cares/config/android/ares_config.h**的**HAVE_GETSERVBYPORT_R**宏注释掉
* 编译动态库时需要将**common.gypi**文件第130,131行的参数全部改为**-fPIC**

