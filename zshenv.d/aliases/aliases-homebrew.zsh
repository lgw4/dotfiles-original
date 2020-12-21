# shellcheck shell=zsh
if [[ "${OSTYPE}" == darwin* ]] && [[ "$(arch)" == "arm64" ]] && [[ -f "/opt/homebrew/bin/brew" ]] && [[ -f "/usr/local/bin/brew" ]]; then
    alias ibrew='arch -x86_64 /usr/local/bin/brew'
    alias brew='/opt/homebrew/bin/brew'
fi
