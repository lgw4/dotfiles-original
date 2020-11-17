# shellcheck shell=bash
if [[ -d /usr/local/opt/readline ]]; then 
    export CPPFLAGS="-I/usr/local/opt/readline/include ${CPPFLAGS}"
    export LDFLAGS="-L/usr/local/opt/readline/lib ${LDFLAGS}"
    path_prepend /usr/local/opt/readline/lib/pkgconfig PKG_CONFIG_PATH
fi
