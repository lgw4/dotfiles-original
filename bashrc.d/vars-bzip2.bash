# shellcheck shell=bash
if [[ -d ${HOMEBREW_ROOT}/opt/bzip2 ]]; then
    export CPPFLAGS="-I${HOMEBREW_ROOT}/opt/bzip2/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_ROOT}/opt/bzip2/lib ${LDFLAGS}"
    path_prepend "${HOMEBREW_ROOT}/opt/bzip2/lib/pkgconfig" PKG_CONFIG_PATH
fi
