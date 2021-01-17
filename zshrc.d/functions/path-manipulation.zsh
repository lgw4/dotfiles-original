#!/usr/bin/env zsh
path_append () {
    typeset -U PATH path
    path+=("$1")
    export PATH
}

path_prepend () {
    typeset -U PATH path
    path=("$1" "$path[@]")
    export PATH
}
