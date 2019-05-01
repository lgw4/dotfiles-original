# -*- mode: sh; -*-

# Prepend $HOME/.local/bin to PATH
ULB="${HOME}/.local/bin"
if [[ -d "${ULB}" ]] && [[ ":${PATH}:" != *":${ULB}:"* ]]; then
    export PATH="${ULB}:${PATH}"
fi