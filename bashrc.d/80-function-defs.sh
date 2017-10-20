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
    PS1+="\[${R}\]\u\[${D}\] at \[${P}\]\h\[${D}\] in\[${B}\] \W\[${D}\]"
    
    # Python virtual environments
    if [ ${VIRTUAL_ENV} ]; then
        PS1+=" \[${D}\](\[${Y}\]`basename \"${VIRTUAL_ENV}\"`\[${D}\])"
    fi
    
    # Git status (if available)
    if command -v brew > /dev/null 2>&1; then
        if [ -f "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh" ]; then
            GIT_PS1_SHOWDIRTYSTATE=1
            source "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh"
            PS1+=' $(__git_ps1 "\[${D}\](\[${G}\]%s\[${D}\])")'
        fi
    fi

    # prompt $ or # for root
    PS1+="\n\$ "

}

# cdf(): cd to the PATH of the front Finder window
if [ ${OS_KERNEL} == "Darwin" ]; then
    function cdf () {
        target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
        if [ "${target}" != "" ]; then
            cd "${target}"; pwd
        else
            echo 'No Finder window found' >&2
        fi
    }
fi

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=${COMP_CWORD} \
                   PIP_AUTO_COMPLETE=1 ${1} ) )
}
complete -o default -F _pip_completion pip2
complete -o default -f _pip_completion pip2.7
complete -o default -F _pip_completion pip3
complete -o default -F _pip_completion pip3.6
# pip bash completion end

# pipsi bash completion
_pipsi() {
    local cur prev commands opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    first="${COMP_WORDS[0]}"

    commands=$($first --help | awk '/Commands\:/,/Options\:/' | \
               \grep -E -o "^\s{2}[[:lower:]]+" | tr -d ' ')
    opts=$($first --help | \grep -E -o "((-\w{1}|--(\w|-)*=?)){1,2}")


    if [ $COMP_CWORD == 1 ] ; then
        COMPREPLY=( $(compgen -W "${commands}" -- ${cur}) )
        return 0
    fi

    if [[ ${cur} == -* ]] ; then
	local command_opts
        command_opts=$($first $prev --help | \
                             \grep -E -o "((-\w{1}|--(\w|-)*=?)){1,2}")
        COMPREPLY=( $(compgen -W "${command_opts}" -- ${cur}) )
        return 0
    fi
}
complete -o default -F _pipsi pipsi
# pipsi bash completion end