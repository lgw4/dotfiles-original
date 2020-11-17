# shellcheck shell=bash
if [[ -d /usr/local/opt/zlib ]]; then 
    export CPPFLAGS="-I/usr/local/opt/zlib/include ${CPPFLAGS}"
    export LDFLAGS="-L/usr/local/opt/zlib/lib ${LDFLAGS}"
    path_prepend /usr/local/opt/zlib/lib/pkgconfig PKG_CONFIG_PATH
fi
