# shellcheck shell=bash
if [[ -d ${HOMEBREW_PREFIX}/opt/readline ]]; then 
    export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/readline/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/readline/lib ${LDFLAGS}"
    path_prepend ${HOMEBREW_PREFIX}/opt/readline/lib/pkgconfig PKG_CONFIG_PATH
fi
