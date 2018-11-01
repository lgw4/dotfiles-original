# -*- mode: sh; -*-

# Enable globstar
if ((BASH_VERSINFO[0] > 3)); then
    shopt -s globstar
fi

# Get OS kernel name
export OS_KERNEL="$(uname -s)"

# Import files from ${HOME}/.bashrc.d
if [[ -d "${HOME}/.bashrc.d" ]]; then
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
HISTSIZE=1024
HISTFILESIZE=2048

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# macOS settings
if [[ "${OS_KERNEL}" == "Darwin" ]] && command -v brew > /dev/null 2>&1; then
    export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
    # Enable bash-completion with Homebrew
    if [[ -f "/usr/local/share/bash-completion/bash_completion" ]]; then
        source "/usr/local/share/bash-completion/bash_completion"
    fi
# GNU/Linux settings
elif [[ ${OS_KERNEL} == "Linux" ]]; then
    if [[ -f "/etc/bash_completion" ]] && ! shopt -oq posix; then
        source "/etc/bash_completion"
    fi
fi

# Enable pyenv
if [[ ! -v VIRTUAL_ENV ]]; then
    if [[ -d "${HOME}/.pyenv/bin" ]]; then
        export PATH="${HOME}/.pyenv/bin":"${PATH}"
    fi
    if command -v pyenv > /dev/null 2>&1; then
        eval "$(pyenv init -)"
        export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    fi
fi
