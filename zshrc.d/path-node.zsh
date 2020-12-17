# shellcheck shell=zsh
# Homebrew npm executables
if [[ ! -v VIRTUAL_ENV ]] && [[ -d /usr/local/share/npm/bin ]]; then
    typeset -U PATH path
    path=(/usr/local/share/npm/bin $path[@])
    export PATH
fi

# nvm
export NVM_DIR="${HOME}/.nvm"
if [[ -e "$NVM_DIR"/nvm.sh ]]; then
    source "$NVM_DIR"/nvm.sh
fi
# nvm bash completion
if [[ -r "$NVM_DIR"/bash_completion ]]; then
    source "$NVM_DIR"/bash_completion
fi
