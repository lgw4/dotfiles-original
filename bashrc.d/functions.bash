# shellcheck shell=bash
# shellcheck disable=SC1090,SC2034,SC2140,SC2155
generate_prompt() {
    # Preserve history across sessions
    builtin history -a
    builtin history -c
    builtin history -r
    # Terminal color codes
    blue="\[\e[0;34m\]"
    cyan="\[\e[0;36m\]"
    default="\[\e[0m\]"
    green="\[\e[0;32m\]"
    orange="\[\e[0;38;5;166m\]"
    purple="\[\e[0;35m\]"
    red="\[\e[0;31m\]"
    yellow="\[\e[0;33m\]"
    # Clear PS1 prompt
    PS1=""
    # Terminal title bar
    if [[ "$TERM" == "linux" ]] || [[ "$TERM" == "eterm-color" ]]; then
        PS1+="\n"
    else
        PS1+="\[\e[G\]\[\e]0;\u@\h: \w\007\]\n"
    fi
    # Basic information (user at host in path)
    PS1+="${red}\u${default} at ${purple}\h${default} in ${blue}\W${default} "
    # Git status (if available)
    if [[ "$OS_KERNEL" == "Darwin" ]] && command -v brew > /dev/null 2>&1; then
        if [[ -r /usr/local/etc/bash_completion.d/git-prompt.sh ]]; then
            GIT_PROMPT_COMMAND="/usr/local/etc/bash_completion.d/git-prompt.sh"
        fi
    elif [[ "$OS_KERNEL" == "Linux" ]]; then
        if [[ -r /etc/bash_completion.d/git-prompt ]]; then
            GIT_PROMPT_COMMAND="/etc/bash_completion.d/git-prompt"
        fi
    fi
    if [[ -r "$GIT_PROMPT_COMMAND" ]]; then
        GIT_PS1_SHOWDIRTYSTATE=1
        source "$GIT_PROMPT_COMMAND"
        PS1+="$(__git_ps1 "${default}on ${cyan}%s${default} ")"
    fi
    # Python virtual environments
    if [[ -v VIRTUAL_ENV ]]; then
        PS1+="${default}(${orange}$(basename "$VIRTUAL_ENV")${default})"
    fi
    # Prompt ($ for regular users or # for root)
    PS1+="\n\$ "

    unset -v blue
    unset -v cyan
    unset -v default
    unset -v green
    unset -v orange
    unset -v purple
    unset -v red
    unset -v yellow
}

# cdf(): cd to the PATH of the front Finder window
if [[ "$OS_KERNEL" == "Darwin" ]]; then
    cdf() {
        target="$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')"
        if [[ "$target" != "" ]]; then
            cd "$target" && pwd
        else
            echo "No Finder window found." >&2
        fi
    }
fi

# From https://github.com/sharfah/dotfiles/blob/master/.bash/.bash_dyncompletion.d/_compopt_o_filenames
# Fixes error from Homebrew's rustc-completion formula, which is from
# https://github.com/roshan/rust-bash-completion
_compopt_o_filenames ()
{
    type compopt &>/dev/null && compopt -o filenames 2> /dev/null || compgen -f /non-existing-dir/ > /dev/null
}

# From https://bitbucket.org/flowblok/shell-startup/src/default/.shell/env_functions
# Which is based upon https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html

# Usage: indirect_expand PATH -> $PATH
indirect_expand () {
    env | sed -n "s/^$1=//p"
}

# Usage: path_remove /path/to/bin [PATH]
# To remove ~/bin from $PATH
#     path_remove ~/bin PATH
path_remove () {
    local IFS=':'
    local newpath
    local dir
    local var=${2:-PATH}
    for dir in $(indirect_expand "$var"); do
        IFS=''
        if [ "$dir" != "$1" ]; then
            newpath=$newpath:$dir
        fi
    done
    export "$var"="${newpath#:}"
}

# Usage: path_prepend /path/to/bin [PATH]
# To prepend ~/bin to $PATH
#     path_prepend ~/bin PATH
path_prepend () {
    path_remove "$1" "$2"
    local var="${2:-PATH}"
    local value=$(indirect_expand "$var")
    export "${var}"="${1}${value:+:${value}}"
}

# Usage: path_append /path/to/bin [PATH]
# To append ~/bin to $PATH
#     path_append ~/bin PATH
path_append () {
    path_remove "${1}" "${2}"
    local var=${2:-PATH}
    local value=$(indirect_expand "$var")
    export "$var"="${value:+${value}:}${1}"
}
