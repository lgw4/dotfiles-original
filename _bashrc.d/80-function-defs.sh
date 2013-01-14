# ${HOME}/.bashrc.d/function_defs.sh file

function __prompt_command() {

    # clear PS1 prompt
    PS1=""

    # terminal title bar                                                                        
    if [ ${TERM} == "linux" ]; then
        PS1+="\n"
    elif [ ${OS_KERNEL} == "Darwin" ]; then
        PS1+="\[\033[G\]\[\033]0;\u at \h\007\]\n"
    elif [ ${OS_KERNEL} == "Linux" ]; then
        PS1+="\[\033[G\]\[\033]0;\u@\h: \w\007\]\n"
    fi

    # if logged in via ssh shows the ip of the client
    if [ -n "$SSH_CLIENT" ]; then \
        PS1+="\[$Y\]("${$SSH_CLIENT%% *}")\[$D\]"; 
    fi

    # basic information (user@host:path)
    PS1+="\[$R\]\u\[$D\] at \[$P\]\h\[$D\] in\[$B\] \w\[$D\] "

    # prompt $ or # for root
    PS1+="\n\$ "

}

