# shellcheck shell=bash
if [[ -d ${HOMEBREW_PREFIX}/opt/zlib ]]; then 
    export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/zlib/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/zlib/lib ${LDFLAGS}"
    path_prepend ${HOMEBREW_PREFIX}/opt/zlib/lib/pkgconfig PKG_CONFIG_PATH
fi
