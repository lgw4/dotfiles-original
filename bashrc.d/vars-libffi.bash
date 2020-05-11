# shellcheck shell=bash
if [[ -d /usr/local/opt/libffi/ ]]; then
    export CPPFLAGS="-I/usr/local/opt/libffi/include ${CPPFLAGS}"
    export LDFLAGS="-L/usr/local/opt/libffi/lib ${LDFLAGS}"
    path_append /usr/local/opt/libffi/lib/pkgconfig PKG_CONFIG_PATH
fi
