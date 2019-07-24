# Dockerfile to build Janus container

FROM ubuntu:16.04

MAINTAINER ckousik@caffeine.tv

RUN apt-get update && \
	apt-get upgrade -y
RUN apt-get install -y \
    curl  \
    git \
    jq \
    pkg-config \
    software-properties-common \
    make \
    automake \
    autoconf \
    build-essential \
    gengetopt \
    libtool \
    openssl \
    gtk-doc-tools \
    wget

RUN apt-get install -y \
    --no-install-recommends \
    libglib2.0-dev \
    libjansson-dev \
    libmicrohttpd-dev \
    libmicrohttpd10 \
    libopus-dev \
    libogg-dev \
    libsofia-sip-ua-dev \
    libssl-dev \
    libwebsockets-dev \
    libwebsockets7

# libconfig
RUN wget https://hyperrealm.github.io/libconfig/dist/libconfig-1.7.2.tar.gz \
    && tar xfv libconfig-1.7.2.tar.gz \
    && rm -rf libconfig-1.7.2.tar.gz \
    && cd libconfig-1.7.2 \
    && ./configure \
    --enable-static \
    && make install

RUN git clone https://gitlab.freedesktop.org/libnice/libnice.git \
    && cd libnice \
    && git checkout tags/0.1.16 \
    && ./autogen.sh \
    && ./configure \
    --enable-static \
    && make install

# Install libsrtp
RUN cd ~ \
    && git clone https://github.com/cisco/libsrtp.git \
    && cd libsrtp \
    && git checkout v2.0.0 \
    && ./configure --enable-openssl \
    && make shared_library \
    && make install

# RUN mkdir janus-gateway
# COPY . janus-gateway/
# WORKDIR janus-gateway

# # make Janus
# RUN sh autogen.sh
# RUN ./configure \
#     --prefix=/opt/janus \
#     --disable-data-channels \
#     --disable-docs \
#     --disable-mqtt \
#     --disable-plugin-audiobridge \
#     --disable-plugin-echotest \
#     --disable-plugin-recordplay \
#     --disable-plugin-sip \
#     --disable-plugin-textroom \
#     --disable-plugin-videocall \
#     --disable-plugin-voicemail \
#     --disable-post-processing \
#     --disable-rabbitmq \
#     --disable-turn-rest-api \
#     --disable-sample-event-handler \
#     --disable-websockets \
#     --enable-unix-sockets \
#     --enable-plugin-streaming \
#     --enable-plugin-videoroom \
#     --enable-rest \
#     --enable-static

# RUN make check install
