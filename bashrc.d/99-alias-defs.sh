# ${HOME}/.bashrc.d/alias_defs.sh file

if [ ${OS_KERNEL} == "Darwin" ]; then
    alias ls='ls -FG'
    alias finder='open -a Finder ./'
    if [ -d "/Applications/Yoink.app" ]; then
        alias yoink='open -a Yoink'
    fi
    if [ -d "${HOME}/.pythonz" ]; then
        alias pythonz='LDFLAGS="-L/usr/local/opt/openssl/lib" CPPFLAGS="-I/usr/local/opt/openssl/include" pythonz'
    fi
elif [ ${OS_KERNEL} == "Linux" ]; then
    alias ls='ls --color=auto'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    alias gvim='gvim -f'
fi

# perlbrew
if [ -d "${HOME}/.perlbrew" ]; then
    alias plbrew='perlbrew'
fi

