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
fi
