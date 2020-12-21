# shellcheck shell=zsh
if [[ "${OSTYPE}" == darwin* ]]; then
    alias ls='ls -FG'
    alias finder='open -a Finder ./'
else
    alias ls='ls -F --color=auto'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    alias gvim='gvim -f'
fi
