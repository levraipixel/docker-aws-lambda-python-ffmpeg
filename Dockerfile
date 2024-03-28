FROM public.ecr.aws/lambda/python:3.12

RUN dnf -y update && \
    dnf install -y \
      cmake3 \
      gcc \
      nasm \
      tar \
      wget \
      xz && \
    wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz && \
    tar -xf ffmpeg-6.1.1.tar.xz && \
    cd ffmpeg-6.1.1 && \
    ./configure --disable-static --enable-shared && \
    make && \
    make install && \
    cd .. && \
    rm -r ffmpeg-6.1.1 && \
    rm ffmpeg-6.1.1.tar.xz && \
    dnf remove -y \
      annobin-plugin-gcc \
      binutils \
      cmake \
      cmake-data \
      cmake-rpm-macros \
      cpp \
      cryptsetup-libs \
      device-mapper \
      device-mapper-libs \
      gcc \
      glibc-devel \
      guile22 \
      libxcrypt-devel \
      make \
      nasm \
      python-unversioned-command \
      python3 \
      python3-libs \
      python3-pip \
      python3-setuptools \
      tar \
      util-linux \
      wget \
      xz && \
    dnf clean all

ENV LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH}"
