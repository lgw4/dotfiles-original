# ${HOME}/.bashrc.d/80-function-defs.sh file

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

    # basic information (user at host in path)
    PS1+="\[$R\]\u\[$D\] at \[$P\]\h\[$D\] in\[$B\] \w\[$D\] "

    # get git branch
    branch="`git branch 2> /dev/null | grep "*" | sed -e s/^..//g`"
    if [[ ! -z ${branch} ]]; then
        PS1+="\[$D\]on \[$G\]${branch}\[$D\] "
    fi
   
    # check if git repo is rebasing
    if [[ -d .git/rebase-apply ]]; then
        PS1+="\[$Y\]REBASING\[$D\] "
    fi
    
    # check if git repo is dirty
    if [ -n "`git status --porcelain 2> /dev/null`" ]; then
        PS1+="\[$C\]*\[$D\] "
    fi

    # svn status
    rev="`svn info 2>/dev/null | grep Revision | sed -e 's/Revision: //'`"
    if [[ ! -z ${rev} ]]; then
        status="`svn st | grep '^[^ ][ CM]' | sed -Ee 's/^(.).*$/\1/' | awk 'x[$0]++ 0'`"
        PS1+="\[$D\]on \[$G\]r${rev}\[$D\] \[$C\]${status[*]}\[$D\] "
    fi

    # prompt $ or # for root
    PS1+="\n\$ "

}

