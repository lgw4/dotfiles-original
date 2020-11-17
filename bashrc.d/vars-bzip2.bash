# shellcheck shell=bash
if [[ -d /usr/local/opt/bzip2 ]]; then 
    export CPPFLAGS="-I/usr/local/opt/bzip2/include ${CPPFLAGS}"
    export LDFLAGS="-L/usr/local/opt/bzip2/lib ${LDFLAGS}"
    path_prepend /usr/local/opt/bzip2/lib/pkgconfig PKG_CONFIG_PATH
fi
