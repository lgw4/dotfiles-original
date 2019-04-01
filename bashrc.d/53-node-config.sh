# -*- mode: sh; -*-

# NPM executables
if [[ ! -v VIRTUAL_ENV ]] && [[ -d "/usr/local/share/npm/bin" ]] ; then
    export PATH="${PATH}:/usr/local/share/npm/bin"
fi

# nvm
if [[ -e "${HOME}/.nvm/nvm.sh" ]]; then
    source "${HOME}/.nvm/nvm.sh"
fi

# nvm completion
if [[ -r "${NVM_DIR}/bash_completion" ]]; then
    source "${NVM_DIR}/bash_completion"
fi
