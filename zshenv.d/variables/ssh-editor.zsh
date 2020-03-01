# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
elif [[ $OS_KERNEL == 'Darwin' ]]; then
    export EDITOR='code'
else
    export EDITOR='vim'
fi
