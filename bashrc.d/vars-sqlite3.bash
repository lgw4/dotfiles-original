# shellcheck shell=bash
if [[ -d ${HOMEBREW_PREFIX}/opt/zlib ]]; then 
    export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/sqlite/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/sqlite/lib ${LDFLAGS}"
    path_prepend ${HOMEBREW_PREFIX}/opt/sqlite/lib/pkgconfig PKG_CONFIG_PATH
fi
