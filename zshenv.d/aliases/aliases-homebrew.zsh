# shellcheck shell=zsh
if [[ $OSTYPE == darwin* ]] && [[ -f /opt/homebrew/bin/brew ]] && [[ -f /usr/local/bin/brew ]]; then
    alias brew='arch -x86_64 /usr/local/bin/brew'
    alias abrew="/opt/homebrew/bin/brew"
fi
