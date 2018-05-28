# -*- mode: sh; -*-

if [[ "${LOGIN_SHELL}" == "True" ]]; then
    if [[ -d "${HOME}/.cabal/bin" ]]; then
        export PATH="${PATH}:${HOME}/.cabal/bin"
    fi
fi
