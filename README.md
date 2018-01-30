# build nodejs for android
编译Node为Android arm64架构下的可执行文件和动态库．

## 测试环境
* ubuntu16.04(docker)
* android ndk r13b
* node v6.10.0

## 编译步骤
* 执行命令
  ```shell
  make
  ```
## 问题记录
* 编译动态库时需要将**deps/cares/config/android/ares_config.h**的**HAVE_GETSERVBYPORT_R**宏注释掉，见patch文件。
* 编译动态库时需要将**common.gypi**文件第130,131行的参数全部改为**-fPIC**，见patch文件。

