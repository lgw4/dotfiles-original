# shellcheck shell=zsh
if [[ $OSTYPE == darwin* ]]; then
    if [[ -f /opt/homebrew/bin/brew ]] && [[ -f /usr/local/bin/brew ]]; then
        alias brew='arch -x86_64 /usr/local/bin/brew'
        alias abrew="/opt/homebrew/bin/brew"
    fi
    alias ls='ls -FG'
    alias finder='open -a Finder ./'
    if [[ -d "/Applications/Yoink.app" ]]; then
        alias yoink='open -a Yoink'
    fi
else
    alias ls='ls -F --color=auto'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    alias gvim='gvim -f'
fi
