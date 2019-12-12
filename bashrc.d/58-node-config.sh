# -*- mode: sh; -*-

# Homebrew npm executables

if [[ ! -v VIRTUAL_ENV ]]; then
    add_to_path "/usr/local/share/npm/bin"
fi

# nvm
export NVM_DIR="${HOME}/.nvm"
if [[  -s "/usr/local/opt/nvm/nvm.sh" ]]; then
    source "/usr/local/opt/nvm/nvm.sh"
elif [[ -e "${NVM_DIR}/nvm.sh" ]]; then
    source "${NVM_DIR}/nvm.sh"
fi

if [[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ]]; then
    source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
elif [[ -r "${NVM_DIR}/bash_completion" ]]; then
    source "${NVM_DIR}/bash_completion"
fi
