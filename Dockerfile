ARG UVersion="20.04"
FROM ubuntu:${UVersion}

USER root

ENV TZ=Asia/Shanghai

ARG LEDE_USER=lede

ARG DEBIAN_FRONTEND=noninteractive

ARG LEDE_REQ=https://raw.githubusercontent.com/AllsVoid/openwrt_docker/main/lede-req

RUN apt-get update -qqy && \
    apt-get upgrade -qqy && \
    apt-get install gcc automake autoconf libtool make -qqy && \
    apt-get install curl -qqy
RUN apt-get install -y $(curl -fsSL ${LEDE_REQ}) && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN groupadd docker && \
    useradd ${LEDE_USER} -g docker

WORKDIR /home

RUN git clone https://github.com/coolsnowwolf/lede

WORKDIR /home/lede

RUN echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default && \
    echo "src-git small https://github.com/kenzok8/small" >> feeds.conf.default && \
    git pull   

RUN ./scripts/feeds update -a && \
    ./scripts/feeds install -a
    
