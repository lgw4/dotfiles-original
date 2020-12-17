# shellcheck shell=bash
if [[ -d ${HOMEBREW_ROOT}/opt/libffi/ ]]; then
    export CPPFLAGS="-I${HOMEBREW_ROOT}/opt/libffi/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_ROOT}/opt/libffi/lib ${LDFLAGS}"
    path_append "${HOMEBREW_ROOT}/opt/libffi/lib/pkgconfig" PKG_CONFIG_PATH
fi
