# -*- mode: sh; -*-

if [[ ! -v VIRTUAL_ENV ]]; then
    if [[ -d "${HOME}/.cabal/bin" ]]; then
        export PATH="${PATH}:${HOME}/.cabal/bin"
    fi
fi
