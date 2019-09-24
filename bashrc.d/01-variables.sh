# ~/.bashrc.d/01-variables-defs.bash

if command -v code > /dev/null 2>&1; then
    export EDITOR="code"
else
    export EDITOR="vim"
fi
