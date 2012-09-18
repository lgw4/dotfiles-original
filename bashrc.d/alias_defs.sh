# ${HOME}/.bashrc.d/alias_defs.sh file

if [ ${OS_KERNEL} == "Darwin" ]; then
    alias ls="ls -FG"
    alias finder="open ."
elif [ ${OS_KERNEL} == "Linux" ]; then
    alias ls='ls --color=auto'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
fi

if [ -d ${HOME}/.perlbrew ]; then
    alias plbrew="perlbrew"
fi

