# shellcheck shell=bash
if [[ -d /usr/local/opt/openssl@1.1/ ]]; then
    export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include ${CPPFLAGS}"
    export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib ${LDFLAGS}"
    path_append /usr/local/opt/openssl@1.1/lib/pkgconfig PKG_CONFIG_PATH
fi
