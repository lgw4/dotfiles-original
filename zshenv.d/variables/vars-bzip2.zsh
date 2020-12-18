# shellcheck shell=zsh
if [[ -d ${HOMEBREW_ROOT}/opt/bzip2 ]]; then
    export CPPFLAGS="-I${HOMEBREW_ROOT}/opt/bzip2/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_ROOT}/opt/bzip2/lib ${LDFLAGS}"
    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+:}${HOMEBREW_ROOT}/opt/bzip2/lib/pkgconfig"
fi
