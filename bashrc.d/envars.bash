# Terminal color codes
blue="\[\e[0;34m\]"
cyan="\[\e[0;36m\]"
default="\[\e[0m\]"
green="\[\e[0;32m\]"
orange="\[\e[0;38;5;166m\]"
purple="\[\e[0;35m\]"
red="\[\e[0;31m\]"
yellow="\[\e[0;33m\]"

# Set EDITOR variable
if command -v code > /dev/null 2>&1 && [[ ! -v SSH_CONNECTION ]]; then
    export EDITOR="code"
else
    export EDITOR="vim"
fi
