# -*- mode: sh; -*-

# NPM executables
if [[ ! -v VIRTUAL_ENV ]] && [[ -d "/usr/local/share/npm/bin" ]] ; then
    export PATH="${PATH}:/usr/local/share/npm/bin"
fi

# nvm
export NVM_DIR="${HOME}/.nvm"
if [[ -e "${NVM_DIR}/nvm.sh" ]]; then
    source "${NVM_DIR}/nvm.sh"
fi

# nvm completion
if [[ -r "${NVM_DIR}/bash_completion" ]]; then
    source "${NVM_DIR}/bash_completion"
fi
