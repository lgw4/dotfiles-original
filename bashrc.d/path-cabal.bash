# shellcheck shell=bash
if [[ ! -v VIRTUAL_ENV ]]; then
    path_prepend "$HOME"/.cabal/bin PATH
fi
