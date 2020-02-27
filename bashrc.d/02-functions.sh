# ~/.bashrc.d/02-function-defs.sh

# __prompt_command(): function to generate custom PS1 prompt
function __prompt_command {
    # preserve history across sessions
    builtin history -a
    builtin history -c
    builtin history -r
    # clear PS1 prompt
    PS1=""
    # terminal title bar
    if [[ ${TERM} == "linux" ]] || [[ ${TERM} == "eterm-color" ]]; then
        PS1+="\n"
    else
        PS1+="\[\e[G\]\[\e]0;\u@\h: \w\007\]\n"
    fi
    # basic information (user at host in path)
    PS1+="\[${red}\]\u\[${default}\] at \[${purple}\]\h\[${default}\] in\[${blue}\] \W\[${default}\] "
    # Git status (if available)
    if [[ ${OS_KERNEL} == "Darwin" ]] && command -v brew > /dev/null 2>&1; then
        if [[ -f "/usr/local/etc/bash_completion.d/git-prompt.sh" ]]; then
            GIT_PROMPT_COMMAND="/usr/local/etc/bash_completion.d/git-prompt.sh"
        fi
    elif [[ ${OS_KERNEL} == "Linux" ]]; then
        if [[ -f "/etc/bash_completion.d/git-prompt" ]]; then
            GIT_PROMPT_COMMAND="/etc/bash_completion.d/git-prompt"
        fi
    fi
    if [[ -f ${GIT_PROMPT_COMMAND} ]]; then
        GIT_PS1_SHOWDIRTYSTATE=1
        source ${GIT_PROMPT_COMMAND}
        PS1+='$(__git_ps1 "\[${default}\]on \[${cyan}\]%s\[${default}\] ")'
    fi
    # Python virtual environments
    if [[ ${VIRTUAL_ENV} ]]; then
        PS1+="\[${default}\](\[${orange}\]`basename \"${VIRTUAL_ENV}\"`\[${default}\])"
    fi
    # prompt $ or # for root
    PS1+="\n\$ "
}

function append_path {
    if [[ -d "${1}" ]] && [[ ! "${PATH}" =~ (^|:)"${1}"(:|$) ]]; then
            export PATH="${PATH}:${1}"
    fi
}

function prepend_path {
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
