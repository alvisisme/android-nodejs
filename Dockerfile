# https://github.com/alvisisme/docker-ubuntu-non-root-with-utils/blob/master/Dockerfile
FROM alvisisme/docker-ubuntu-non-root-with-utils

ENTRYPOINT []
CMD ["/bin/bash"]

ENV PATH=$PATH:/home/dev/arm64/bin
ENV CC=/home/dev/arm64/bin/aarch64-linux-android-gcc --sysroot=/home/dev/arm64/sysroot
ENV CXX=/home/dev/arm64/bin/aarch64-linux-android-g++
ENV LINK=/home/dev/arm64/bin/aarch64-linux-android-g++
ENV LD=/home/dev/arm64/bin/aarch64-linux-android-ld
ENV AR=/home/dev/arm64/bin/aarch64-linux-android-ar
ENV RANLIB=/home/dev/arm64/bin/aarch64-linux-android-ranlib
ENV STRIP=/home/dev/arm64/bin/aarch64-linux-android-strip
ENV OBJCOPY=/home/dev/arm64/bin/aarch64-linux-android-objcopy
ENV OBJDUMP=/home/dev/arm64/bin/aarch64-linux-android-objdump
ENV NM=/home/dev/arm64/bin/aarch64-linux-android-nm
ENV AS=/home/dev/arm64/bin/aarch64-linux-android-as

RUN sudo apt-get update && sudo DEBIAN_FRONTEND=noninteractive apt-get -y install unzip python
# original source: https://dl.google.com/android/repository/android-ndk-r13b-linux-x86_64.zip
#RUN wget https://dl.google.com/android/repository/android-ndk-r13b-linux-x86_64.zip && \
#    unzip android-ndk-r13b-linux-x86_64.zip -d /home/dev && \

RUN git clone https://gitee.com/alvisisme/android-ndk-r13b.git && \
    cd android-ndk-r13b && \
    unzip android-ndk-r13b-linux-x86_64.zip -d /home/dev && \
    cd /home/dev/android-ndk-r13b && \
    build/tools/make_standalone_toolchain.py --arch arm64 --api 21 --stl gnustl --force --install-dir /home/dev/arm64 && \
    rm -rf /home/dev/android-ndk-r13b