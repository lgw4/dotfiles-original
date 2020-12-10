# shellcheck shell=bash
# shellcheck disable=SC1090
# Homebrew npm executables
if [[ ! -v VIRTUAL_ENV ]] && [[ -d /usr/local/share/npm/bin ]]; then
    path_append /usr/local/share/npm/bin PATH
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

if  [[ "${OS_KERNEL}" == "Darwin" ]]; then
    if [[ "$(arch)" == "arm64" ]]; then
        alias nvm='ARCHPREFERENCE="x86_64" nvm'
    fi
fi
