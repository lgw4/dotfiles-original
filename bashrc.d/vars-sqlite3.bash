# shellcheck shell=bash
if [[ -d /usr/local/opt/zlib ]]; then 
    export CPPFLAGS="-I/usr/local/opt/sqlite/include ${CPPFLAGS}"
    export LDFLAGS="-L/usr/local/opt/sqlite/lib ${LDFLAGS}"
    path_prepend /usr/local/opt/sqlite/lib/pkgconfig PKG_CONFIG_PATH
fi
