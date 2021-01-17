#!/usr/bin/env zsh
if [[ $OSTYPE == darwin* ]]; then
    if [[ $(arch) == "arm64" ]] && [[ -f /usr/local/bin/brew ]]; then

        brew () {
            /usr/bin/arch -x86_64 /usr/local/bin/brew "$@"
        }
        brew-arm64 () {
            HOMEBREW_NO_ENV_FILTERING=1 /opt/homebrew/bin/brew "$@"
        }
        zsh-x86_64 () {
            /usr/bin/arch -x86_64 /bin/zsh
        }
    fi

    if [[ -f /opt/homebrew/bin/bat ]]; then
        bat () {
            /opt/homebrew/bin/bat "$@"
        }
    fi

    if [[ -f /opt/homebrew/bin/direnv ]]; then
        direnv () {
            /opt/homebrew/bin/direnv "$@"
        }
    fi

    if [[ -f /opt/homebrew/bin/git ]]; then
        git () {
            /opt/homebrew/bin/git "$@"
        }
    fi

    if [[ -f /opt/homebrew/bin/htop ]]; then
        htop () {
            /opt/homebrew/bin/htop "$@"
        }
    fi

    if [[ -f /opt/homebrew/bin/starship ]]; then
        starship () {
            /opt/homebrew/bin/starship "$@"
        }
    fi

    if [[ -f /opt/homebrew/bin/tree ]]; then
        tree () {
            /opt/homebrew/bin/tree "$@"
        }
    fi
fi
