# shellcheck shell=bash
if [[ $OSTYPE == darwin* ]]; then
    if [[ $(arch) == "arm64" ]] && [[ -f /usr/local/bin/brew ]]; then
        function brew {
            /usr/bin/arch -x86_64 /usr/local/bin/brew "$@"
        }
        function brew-arm64 {
            HOMEBREW_NO_ENV_FILTERING=1 /opt/homebrew/bin/brew "$@"
        }
        function bash-x86_64 {
            /usr/bin/arch -x86_64 /usr/local/bin/bash
        }
    fi

    if [[ -f /opt/homebrew/bin/starship ]]; then
        function starship {
            /opt/homebrew/bin/starship "$@"
        }
    fi

    if [[ -f /opt/homebrew/bin/git ]]; then
        function git {
            /opt/homebrew/bin/git "$@"
        }
    fi

    if [[ -f /opt/homebrew/bin/tree ]]; then
        function tree {
            /opt/homebrew/bin/tree "$@"
        }
    fi

    if [[ -f /opt/homebrew/bin/bat ]]; then
        function bat {
            /opt/homebrew/bin/bat "$@"
        }
    fi

    if [[ -f /opt/homebrew/bin/htop ]]; then
        function htop {
            /opt/homebrew/bin/htop "$@"
        }
    fi
fi
