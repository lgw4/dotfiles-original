# shellcheck shell=bash
if [[ -d ${HOMEBREW_PREFIX}/opt/libffi/ ]]; then
    export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/libffi/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/libffi/lib ${LDFLAGS}"
    path_append ${HOMEBREW_PREFIX}/opt/libffi/lib/pkgconfig PKG_CONFIG_PATH
fi
