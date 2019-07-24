#!/bin/bash

set -e

PREFIX=/opt/janus
DEP_PRE=/usr/local/lib

function prepare_directories {
  mkdir -p $CF_VOLUME_PATH/$PREFIX/lib/
}

function copy_deps {
  cp -P $DEP_PRE/libsrtp* $CF_VOLUME_PATH/$PREFIX/lib
  cp -P $DEP_PRE/libnice* $CF_VOLUME_PATH/$PREFIX/lib
  cp -P $DEP_PRE/libconfig* $CF_VOLUME_PATH/$PREFIX/lib
}

function build_janus {
  echo "Building Janus"
  sh autogen.sh
  ./configure \
    --prefix=$PREFIX \
    --disable-data-channels \
    --disable-docs \
    --disable-mqtt \
    --disable-plugin-audiobridge \
    --disable-plugin-echotest \
    --disable-plugin-recordplay \
    --disable-plugin-sip \
    --disable-plugin-textroom \
    --disable-plugin-videocall \
    --disable-plugin-voicemail \
    --disable-post-processing \
    --disable-rabbitmq \
    --disable-turn-rest-api \
    --disable-sample-event-handler \
    --disable-websockets \
    --enable-unix-sockets \
    --enable-plugin-streaming \
    --enable-plugin-videoroom \
    --enable-rest \
    --enable-static
  make check install DESTDIR=$CF_VOLUME_PATH
}

# Just adding some skeleton code
function main {
  prepare_directories
  copy_deps
  build_janus
}

main
