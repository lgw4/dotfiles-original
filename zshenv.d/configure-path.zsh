if [[ -d "${HOME}/.local/bin" ]]; then
    path=("${HOME}/.local/bin" ${PATH})
fi

export PATH
