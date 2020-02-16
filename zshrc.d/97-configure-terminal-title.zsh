if [[ ${TERM} == "linux" ]] || [[ ${TERM} == "eterm-color" ]]; then
    precmd () {print -Pn ""}
elif [[ ${OS_KERNEL} == "Darwin" ]]; then
    precmd () {print -Pn "\e]0;%n at %m in %~\a"}
elif [[ ${OS_KERNEL} == "Linux" ]]; then
    precmd () {print -Pn "\e]0;%n@%m: %~\a"}
fi
