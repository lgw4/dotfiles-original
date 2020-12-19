# shellcheck shell=zsh
if [[ ! -v VIRTUAL_ENV ]] && [[ -d "$HOME"/.cargo/bin ]]; then
    typeset -U PATH path
    path=("$HOME"/.cargo/bin $path[@])
    export PATH
fi
