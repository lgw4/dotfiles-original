# shellcheck shell=bash
if [[ -d ${HOMEBREW_ROOT}/opt/zlib ]]; then
    export CPPFLAGS="-I${HOMEBREW_ROOT}/opt/zlib/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_ROOT}/opt/zlib/lib ${LDFLAGS}"
    path_prepend "${HOMEBREW_ROOT}/opt/zlib/lib/pkgconfig" PKG_CONFIG_PATH
fi
