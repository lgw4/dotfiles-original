# shellcheck shell=bash
if [[ -d ${HOMEBREW_PREFIX}/opt/openssl@1.1/ ]]; then
    export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/openssl@1.1/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/openssl@1.1/lib ${LDFLAGS}"
    path_append ${HOMEBREW_PREFIX}/opt/openssl@1.1/lib/pkgconfig PKG_CONFIG_PATH
fi
