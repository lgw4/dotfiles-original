#!/usr/bin/env zsh
path_prepend /usr/local/sbin
path_prepend /usr/local/bin

# macOS HOMEBREW_ROOT
if [[ $OSTYPE == darwin* ]]; then
    if [[ $(arch) == "arm64" ]] && [[ ! -f /usr/local/bin/brew ]]; then
        export HOMEBREW_ROOT="/opt/homebrew"
    else
        export HOMEBREW_ROOT="/usr/local"
    fi
    if [[ $HOMEBREW_ROOT == /usr/local ]]; then
        path_append /opt/homebrew/bin
        path_append /opt/homebrew/sbin
    else
        path_prepend /opt/homebrew/sbin
        path_prepend /opt/homebrew/bin
    fi
fi

# Add /sbin and /usr/sbin to PATH on Debian systems
if [[ $OSTYPE == "linux-gnu" ]]; then
    if [[ -e /etc/debian_version ]]; then
        path_prepend /usr/sbin
        path_prepend /sbin
    fi
fi
