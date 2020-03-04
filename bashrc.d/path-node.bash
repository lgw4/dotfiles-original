# -*- mode: sh; -*-

# Homebrew npm executables
if [[ ! -v VIRTUAL_ENV ]]; then
    append_path /usr/local/share/npm/bin
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
