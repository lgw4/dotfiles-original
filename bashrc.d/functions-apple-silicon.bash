# shellcheck shell=bash
if [[ $OSTYPE == darwin* ]]; then
    if [[ -f /opt/homebrew/bin/brew ]]; then
        brew-arm64() {
            HOMEBREW_NO_ENV_FILTERING=1 /opt/homebrew/bin/brew "$@"
        }
    fi

    if [[ -f /usr/local/bin/brew ]] && [[ $(arch) == arm64 ]]; then
        brew() {
            /usr/bin/arch -x86_64 /usr/local/bin/brew "$@"
        }
        bash-x86_64() {
            /usr/bin/arch -x86_64 /usr/local/bin/bash
        }
    fi

    if [[ -f /opt/homebrew/bin/starship ]]; then
        alias starship='/opt/homebrew/bin/starship'
    fi

    if [[ -f /opt/homebrew/bin/git ]]; then
        alias git='/opt/homebrew/bin/git'
    fi

    if [[ -f /opt/homebrew/bin/tree ]]; then
        alias tree='/opt/homebrew/bin/tree'
    fi

    if [[ -f /opt/homebrew/bin/bat ]]; then
        alias bat='/opt/homebrew/bin/bat'
    fi
fi
