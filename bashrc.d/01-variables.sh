# ~/.bashrc.d/01-variables-defs.sh

if command -v code > /dev/null 2>&1; then
    export EDITOR="code"
else
    export EDITOR="vim"
fi
