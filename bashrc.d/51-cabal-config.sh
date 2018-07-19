# -*- mode: sh; -*-

if [[ -d "${HOME}/.cabal/bin" ]]; then
    export PATH="${PATH}:${HOME}/.cabal/bin"
fi
