FROM public.ecr.aws/lambda/python:3.12

RUN dnf -y update && \
    dnf install -y \
      cmake3 \
      gcc \
      nasm \
      tar \
      wget \
      xz

RUN wget https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.xz && \
    tar -xf ffmpeg-6.1.1.tar.xz && \
    cd ffmpeg-6.1.1 && \
    ./configure && \
    make && \
    make install
