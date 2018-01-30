#!/bin/bash

# build executable
cd /home/dev
git clone --branch v6.10.0 --depth 1 https://github.com/nodejs/node.git /home/dev/node-executable
cd /home/dev/node-executable
./configure --prefix=/home/dev/out/node-executable --dest-cpu=arm64 --dest-os=android --cross-compiling --without-snapshot --without-inspector --without-intl
make
make install
rm -rf /home/dev/node-executable

# build shared lib
cd /home/dev
git clone --branch v6.10.0 --depth 1 https://github.com/nodejs/node.git /home/dev/node-shared-lib
cd /home/dev/node-shared-lib
wget https://raw.githubusercontent.com/alvisisme/android-nodejs/master/node_v6.10.0.patch
patch -p1 <node_v6.10.0.patch && \
./configure --prefix=/home/dev/out/node-shared-lib --dest-cpu=arm64 --dest-os=android --cross-compiling --shared --without-snapshot --without-inspector --without-intl
make
make install
rm -rf /home/dev/node-shared-lib