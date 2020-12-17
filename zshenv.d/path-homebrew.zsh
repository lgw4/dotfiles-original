# shellcheck shell=zsh
if [[ ! -v VIRTUAL_ENV ]]; then
    typeset -U PATH path
    path=(/usr/local/bin /usr/local/sbin $path[@])
    export PATH
fi