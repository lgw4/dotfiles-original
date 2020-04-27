# shellcheck shell=bash
if [[ ! -v VIRTUAL_ENV ]]; then
    path_prepend "$HOME"/.cargo/bin PATH
fi
