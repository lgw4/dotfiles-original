if [[ ${TERM} == "linux" ]] || [[ ${TERM} == "eterm-color" ]]; then
    precmd () {print -Pn ""}
else
    precmd () {print -Pn "\e]0;%n@%m: %~\a"}
fi
