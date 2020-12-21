#!/usr/bin/env zsh
function set_win_title() {
     echo -ne "\033]0; ${USER}@${HOST}: $(dirs) \007"
}
