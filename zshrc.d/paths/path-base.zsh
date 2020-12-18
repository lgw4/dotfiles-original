# shellcheck shell=zsh
if [[ ! -v VIRTUAL_ENV ]]; then
    typeset -U PATH path
    path=(/usr/local/bin /usr/local/sbin $path[@])
    if [[ -e /etc/debian_version ]]; then
        path=(/usr/sbin /sbin $path[@])
    fi
    export PATH
fi
