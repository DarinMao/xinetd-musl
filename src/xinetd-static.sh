#!/bin/ash

apk add --update build-base git linux-headers bsd-compat-headers

wget https://downloads.sourceforge.net/project/libtirpc/libtirpc/1.2.6/libtirpc-1.2.6.tar.bz2
tar xvjf libtirpc*.tar.bz2
cd libtirpc*
./configure --enable-static --disable-gssapi
make
make install
cd ..

git clone https://github.com/xinetd-org/xinetd
cd xinetd
CFLAGS="-s -static -I/usr/include/tirpc" CPPFLAGS="-DHAVE_RLIM_T" ./configure
LDFLAGS="-ltirpc" make
make install
cd ..
