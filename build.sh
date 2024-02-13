#!/usr/bin/env bash

[[ -f Makefile ]] && make clean

autoreconf -i
./configure --prefix=/usr LDFLAGS="-lssl -lcrypto"
make -j$(nproc)

printf "Where to install: "
read IROOT

make DESTDIR=$IROOT install