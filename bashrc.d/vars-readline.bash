# shellcheck shell=bash
if [[ -d ${HOMEBREW_ROOT}/opt/readline ]]; then
    export CPPFLAGS="-I${HOMEBREW_ROOT}/opt/readline/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_ROOT}/opt/readline/lib ${LDFLAGS}"
    path_prepend "${HOMEBREW_ROOT}/opt/readline/lib/pkgconfig" PKG_CONFIG_PATH
fi
