# ${HOME}/.bashrc.d/alias_defs.sh file

if [ ${OS_KERNEL} == "Darwin" ]; then
    alias ls="ls -FG"
    alias finder='open -a Finder ./'
    if [ -d "/Applications/Yoink.app" ]; then
        alias yoink="open -a Yoink"
    fi
elif [ ${OS_KERNEL} == "Linux" ]; then
    alias ls='ls --color=auto'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    alias gvim='gvim -f'
fi

if [ -d "${HOME}/.perlbrew" ]; then
    alias plbrew="perlbrew"
fi

if command -v bundle > /dev/null 2>&1; then
    alias bex="bundle exec"
fi

# ruby-install

if command -v ruby-install > /dev/null 2>&1; then
    alias ruby-install="ruby-install -s ~/.ruby-install"
fi