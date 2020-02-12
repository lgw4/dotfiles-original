# ~/.bashrc.d/02-function-defs.sh

# __prompt_command(): function to generate custom PS1 prompt
function __prompt_command {
    # preserve history across sessions
    history -n
    history -w
    history -c
    history -r
    # clear PS1 prompt
    PS1=""
    # terminal title bar
    if [[ ${TERM} == "linux" ]] || [[ ${TERM} == "eterm-color" ]]; then
        PS1+="\n"
    elif [[ ${OS_KERNEL} == "Darwin" ]]; then
        PS1+="\[\033[G\]\[\033]0;\u at \h on \w\007\]\n"
    elif [[ ${OS_KERNEL} == "Linux" ]]; then
        PS1+="\[\033[G\]\[\033]0;\u@\h: \w\007\]\n"
    fi
    # basic information (user at host in path)
    PS1+="\[${R}\]\u\[${D}\] at \[${P}\]\h\[${D}\] in\[${B}\] \W\[${D}\]"
    # Python virtual environments
    if [[ ${VIRTUAL_ENV} ]]; then
        PS1+=" \[${D}\](\[${Y}\]`basename \"${VIRTUAL_ENV}\"`\[${D}\])"
    fi
    # Git status (if available)
    if [[ ${OS_KERNEL} == "Darwin" ]] && command -v brew > /dev/null 2>&1; then
        if [[ -f "/usr/local/etc/bash_completion.d/git-prompt.sh" ]]; then
            GIT_PS1_SHOWDIRTYSTATE=1
            source "/usr/local/etc/bash_completion.d/git-prompt.sh"
            PS1+=' $(__git_ps1 "\[${D}\](\[${G}\]%s\[${D}\])")'
        fi
    elif [[ ${OS_KERNEL} == "Linux" ]]; then
        if [[ -f "/etc/bash_completion.d/git-prompt" ]]; then
            GIT_PS1_SHOWDIRTYSTATE=1
            source "/etc/bash_completion.d/git-prompt"
            PS1+=' $(__git_ps1 "\[${D}\](\[${G}\]%s\[${D}\])")'
        fi
    fi
    # prompt $ or # for root
    PS1+="\n\$ "
}

# add_to_path(): Add parameter to PATH if it isn't already there
function add_to_path {
    if [[ -d "${1}" ]] && [[ ! "${PATH}" =~ (^|:)"${1}"(:|$) ]]; then
            export PATH="${1}:${PATH}"
    fi
}

# cdf(): cd to the PATH of the front Finder window
if [[ ${OS_KERNEL} == "Darwin" ]]; then
    function cdf {
        target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
        if [[ "${target}" != "" ]]; then
            cd "${target}"; pwd
        else
            echo 'No Finder window found' >&2
        fi
    }
fi
