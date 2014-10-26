# ${HOME}/.bashrc.d/80-function-defs.sh file

# __prompt_command(): function to generate custom PS1 prompt

function __prompt_command() {

    # clear PS1 prompt
    PS1=""

    # terminal title bar
    if [ ${TERM} == "linux" ] || [ ${TERM} == "eterm-color" ]; then
        PS1+="\n"
    elif [ ${OS_KERNEL} == "Darwin" ]; then
        PS1+="\[\033[G\]\[\033]0;\u at \h on \w\007\]\n"
    elif [ ${OS_KERNEL} == "Linux" ]; then
        PS1+="\[\033[G\]\[\033]0;\u@\h: \w\007\]\n"
    fi

    # basic information (user at host in path)
    PS1+="\[$R\]\u\[$D\] at \[$P\]\h\[$D\] in\[$B\] \W\[$D\] "

    # Git support (if available)
    if [ `which git` > /dev/null ]; then
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
    fi

    # Subversion support (if available)
    if [ `which svn` > /dev/null ]; then
        # svn status
        rev="`svn info 2>/dev/null | grep Revision | sed -e 's/Revision: //'`"
        if [[ ! -z ${rev} ]]; then
            status="`svn st | grep '^[^ ][ CM]' | sed -Ee 's/^(.).*$/\1/' | awk 'x[$0]++ 0'`"
            if [[ ! -z ${status} ]]; then
                status=' *'
            fi
            PS1+="\[$D\]on \[$G\]r${rev}\[$D\]\[$C\]${status}\[$D\] "
        fi
    fi

    # virtualenvwrapper support
    if [ ${VIRTUAL_ENV} ]; then
        PS1+="${D}(${Y}`basename \"${VIRTUAL_ENV}\"`${D}) "
    fi

    # prompt $ or # for root
    PS1+="\n\$ "

}

# cdf(): cd to the PATH of the front Finder window

if [ ${OS_KERNEL} == "Darwin" ]; then
    function cdf () {
        target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
        if [ "$target" != "" ]; then
            cd "$target"; pwd
        else
            echo 'No Finder window found' >&2
        fi
    }
fi

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
complete -o default -F _pip_completion pip3
# pip bash completion end
