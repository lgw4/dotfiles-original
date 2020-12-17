# shellcheck shell=zsh
if [[ $OSTYPE == darwin* ]]; then
    if [[ "$(arch)" == "i386" ]]; then
        export HOMEBREW_ROOT="/usr/local"
    else
        export HOMEBREW_ROOT="/opt/homebrew"
    fi
fi
