# shellcheck shell=zsh
if [[ -d ${HOMEBREW_ROOT}/opt/zlib ]]; then
    export CPPFLAGS="-I${HOMEBREW_ROOT}/opt/zlib/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_ROOT}/opt/zlib/lib ${LDFLAGS}"
    typeset -TU PKG_CONFIG_PATH pkg_config_path
    pkg_config_path=("${HOMEBREW_ROOT}/opt/zlib/lib/pkgconfig" $pkg_config_path[@])
    export PKG_CONFIG_PATH
fi
