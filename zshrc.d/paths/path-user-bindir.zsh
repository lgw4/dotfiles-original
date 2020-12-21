#!/usr/bin/env zsh
if [[ ! -v VIRTUAL_ENV ]]; then
    typeset -U PATH path
    path=("${HOME}/.local/bin" "$path[@]")
    export PATH
fi
