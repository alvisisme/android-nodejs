#!/bin/bash
set -o nounset
set -o errexit

NODEJS_VERSION=6.10.0

CWD=$PWD
mkdir -p $CWD/build

download-node () {
    cd $CWD/build
    if [ ! -d node ];then
        wget https://nodejs.org/dist/v$NODEJS_VERSION/node-v$NODEJS_VERSION.tar.gz -O node.tar.gz
        tar xf node.tar.gz
        mv node-v$NODEJS_VERSION node
    fi
    cd $CWD
}

build-executable () {
    cd $CWD/build
    if [ -d node-executable ];then
        rm -rf node-executable
    fi
    cp -r node node-executable
    cd node-executable
    ./configure --prefix=$CWD/build/node-executable --dest-cpu=arm64 --dest-os=android --cross-compiling --without-snapshot --without-inspector --without-intl
    make
    make install
    cd $CWD
}

build-sharedlib () {
    cd $CWD/build
    if [ -d node-shared-lib ];then
        rm -rf node-shared-lib
    fi
    cp -r node node-shared-lib
    cd node-shared-lib
    cp $CWD/node_v6.10.0.patch .
    patch -f -p1 <$CWD/node_v6.10.0.patch
    ./configure --prefix=$CWD/build/node-shared-lib --dest-cpu=arm64 --dest-os=android --cross-compiling --shared --without-snapshot --without-inspector --without-intl
    make && make install
    cd $CWD
}

download-node
build-executable
build-sharedlib