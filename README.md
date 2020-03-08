# nodejs-for-android

[![Build Status](https://img.shields.io/travis/com/alvisisme/android-nodejs?style=flat-square)](https://travis-ci.com/alvisisme/android-nodejs)

编译nodejs至android平台arm64-v8a架构。

本工程仅编译可执行文件和动态库。

## 目录

- [背景](#背景)
- [安装](#安装)
- [用法](#用法)
- [维护人员](#维护人员)
- [贡献参与](#贡献参与)
- [许可](#许可)

## 背景

编译环境

* Ubuntu 18.04.4 LTS amd64
* android ndk r13b
* node v6.10.0

## 安装

将编译成功后生成的**dist**目录下对应头文件和静态库引入。

## 用法

推荐使用 docker 和 docker-compose 进行编译

```bash
docker-compose up --build
```

编译后的文件位于 **build** 目录

## 维护人员

[@Alvis Zhao](https://github.com/alvisisme)

## 贡献参与

欢迎提交PR。

## 许可

© 2020 Alvis Zhao
