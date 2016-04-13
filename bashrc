# ${HOME}/.bashrc

# Get OS kernel name
export OS_KERNEL="$(uname -s)"

# Import files from ${HOME}/.bashrc.d
if [ -d "${HOME}/.bashrc.d" ]; then
    for f in ${HOME}/.bashrc.d/*.sh; do
        source "${f}"
    done
fi

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2048

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable bash completion
if [ "${OS_KERNEL}" == "Darwin" ] && command -v brew > /dev/null 2>&1; then
    if [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
        source "$(brew --prefix)/share/bash-completion/bash_completion"
    fi
elif [ ${OS_KERNEL} == "Linux" ]; then
    if [ -f "/etc/bash_completion" ] && ! shopt -oq posix; then
        source "/etc/bash_completion"
    fi
fi

# Bash sessions
if [ -r "/etc/bashrc_$TERM_PROGRAM" ]; then
    source "/etc/bashrc_$TERM_PROGRAM"
fi
