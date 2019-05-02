# -*- mode: sh; -*-

# Homebrew npm executables
HB_NPM_BIN="/usr/local/share/npm/bin"
if [[ ! -v VIRTUAL_ENV ]] && [[ -d "${HB_NPM_BIN}" ]] && [[ ":${PATH}:" != *":${HB_NPM_BIN}:"* ]]; then
    export PATH="${HB_NPM_BIN}:${PATH}"
fi

# nvm
export NVM_DIR="${HOME}/.nvm"
if [[ -e "${NVM_DIR}/nvm.sh" ]]; then
    source "${NVM_DIR}/nvm.sh"
fi

if [[ -r "${NVM_DIR}/bash_completion" ]]; then
    source "${NVM_DIR}/bash_completion"
fi
