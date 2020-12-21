#!/usr/bin/env zsh
# Tell me my fortune…
if (( $+commands[fortune] )); then
    echo
    fortune
fi
