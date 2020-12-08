# shellcheck shell=bash
alias refresh='source ~/.bashrc'

if [[ "${OS_KERNEL}" == "Darwin" ]]; then
    if [[ -d /opt/homebrew/bin/brew ]] && [[ -d /usr/local/bin/brew ]]; then
        alias brew='arch -x86_64 /usr/local/bin/brew'
        alias asbrew="/opt/homebrew/bin/brew"
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
