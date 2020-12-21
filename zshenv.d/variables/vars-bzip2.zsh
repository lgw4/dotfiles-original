#!/usr/bin/env zsh
if [[ -d ${HOMEBREW_ROOT}/opt/bzip2 ]]; then
    export CPPFLAGS="-I${HOMEBREW_ROOT}/opt/bzip2/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_ROOT}/opt/bzip2/lib ${LDFLAGS}"
    typeset -TU PKG_CONFIG_PATH pkg_config_path
    pkg_config_path=("${HOMEBREW_ROOT}/opt/bzip2/lib/pkgconfig" $pkg_config_path[@])
    export PKG_CONFIG_PATH
fi
