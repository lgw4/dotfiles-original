# shellcheck shell=bash
if [[ ! -v VIRTUAL_ENV ]]; then
    prepend_path "$HOME"/.cabal/bin
fi
