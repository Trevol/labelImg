FROM ubuntu:20.10

ENV TZ=Europe/Moscow
ENV DEBIAN_FRONTEND=noninteractive

RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y \
  binutils \
  zip \
  git \
  python3.8 \
  python3.8-dev \
  python3-pip \
  pyqt5-dev-tools \
  --no-install-recommends

RUN pip3 install -U lxml setuptools pyqt5 opencv-python PyQt5.sip