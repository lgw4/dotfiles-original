# -*- mode: sh; -*-

# Are we in a login shell?
shopt -q login_shell
if [ $? -eq 0 ]; then
    export LOGIN_SHELL="True"
else
    export LOGIN_SHELL="False"
fi

# Enable globstar
if ((BASH_VERSINFO[0] > 3)); then
    shopt -s globstar
fi

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
HISTSIZE=1024
HISTFILESIZE=2048

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# macOS settings
if [ "${OS_KERNEL}" == "Darwin" ] && command -v brew > /dev/null 2>&1; then
    # Enable bash-completion with Homebrew
    if [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
        source "$(brew --prefix)/share/bash-completion/bash_completion"
    fi
    # Enable Bash Git prompt
    if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"  ]; then
        GIT_PROMPT_THEME=Solarized
        GIT_PROMPT_ONLY_IN_REPO=1
        source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
    fi
# GNU/Linux settings
elif [ ${OS_KERNEL} == "Linux" ]; then
    if [ -f "/etc/bash_completion" ] && ! shopt -oq posix; then
        source "/etc/bash_completion"
    fi
fi

if [ -f "${HOME}/.local/bin/homebrew_api_token.sh" ]; then
    source "${HOME}/.local/bin/homebrew_api_token.sh"
fi
