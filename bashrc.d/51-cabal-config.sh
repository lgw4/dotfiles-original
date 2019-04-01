# -*- mode: sh; -*-

if [[ ! -v VIRTUAL_ENV ]] && [[ -d "${HOME}/.cabal/bin" ]]; then
    export PATH="${PATH}:${HOME}/.cabal/bin"
fi
