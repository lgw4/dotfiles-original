# ${HOME}/.bashrc

# Get OS kernel name
OS_KERNEL=`uname`

# Import files from ${HOME}/.bashrc.d
if [ -d ${HOME}/.bashrc.d ]; then
    for f in ${HOME}/.bashrc.d/*.sh; do
        source ${f}
    done
fi

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Terminal title bar

if [ ${OS_KERNEL} == "Darwin" ]; then
    TB="\[\033[G\]\[\033]0;\u@\h:\007\]\n"
elif [ ${OS_KERNEL} == "Linux" ]; then
    TB="\[\033[G\]\[\033]0;\u@\h: \w\007\]\n"
fi

# Custom prompt
export PS1="${TB}${R}\u ${D}at ${P}\h ${D}in ${B}\
\W${D} \$(parse_git_branch)\$(parse_svn_status)${D}\n\$ "

# Remove /usr/local/bin from PATH
export PATH=${PATH/:\/usr\/local\/bin/}

# Create environment variable for Homebrew installation
HBS_PATH="/usr/local/bin:/usr/local/sbin"

# Create environment variable for $HOME/.local/bin
HOME_BIN="${HOME}/.local/bin"

# Construct custom PATH variable
export PATH="${HOME_BIN}:${HBS_PATH}:${PATH}"

# Enable bash completion
if [ ${OS_KERNEL} == "Darwin" ]; then
    if [ -e /usr/local/bin/brew ]; then
	    if [ -f `brew --prefix`/etc/bash_completion ]; then
            source `brew --prefix`/etc/bash_completion
        fi
    fi
elif [ ${OS_KERNEL} == "Linux" ]; then
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        source /etc/bash_completion
    fi
fi

