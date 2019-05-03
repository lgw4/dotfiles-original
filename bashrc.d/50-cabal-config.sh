# -*- mode: sh; -*-
if [[ ! -v VIRTUAL_ENV ]]; then
    add_to_path "${HOME}/.cabal/bin"
fi
