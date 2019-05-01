# -*- mode: sh; -*-
CABAL_BIN="${HOME}/.cabal/bin"
if [[ ! -v VIRTUAL_ENV ]] && [[ -d "${CABAL_BIN}" ]] && [[ ":${PATH}:" != *":${CABAL_BIN}:"* ]]; then
    export PATH="${CABAL_BIN}:${PATH}"
fi
