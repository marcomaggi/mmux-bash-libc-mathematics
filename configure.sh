#!/bin/sh
# configure.sh --
#

set -ex

prefix=/usr/local
if test -d /lib64
then libdir=${prefix}/lib64
else libdir=${prefix}/lib
fi

# --enable-mbfl
# DISTCHECK_CONFIGURE_FLAGS='--enable-mbfl'

../configure \
    --config-cache				\
    --cache-file=./config.cache			\
    --enable-maintainer-mode                    \
    --disable-static --enable-shared            \
    --prefix="${prefix}"			\
    --libdir="${libdir}"                        \
    CFLAGS='-O3'				\
    "$@"

### end of file
