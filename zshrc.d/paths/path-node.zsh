#!/usr/bin/env zsh
# Homebrew npm executables
if [[ ! -v VIRTUAL_ENV ]] && [[ -d "${HOMEBREW_ROOT}/share/npm/bin" ]]; then
    typeset -U PATH path
    path=("${HOMEBREW_ROOT}/share/npm/bin" "$path[@]")
    export PATH
fi

# nvm
export NVM_DIR="${HOME}/.nvm"
if [[ -e "${NVM_DIR}/nvm.sh" ]]; then
    source "${NVM_DIR}/nvm.sh"
fi
# nvm bash completion
if [[ -r "${NVM_DIR}/bash_completion" ]]; then
    source "${NVM_DIR}/bash_completion"
fi
