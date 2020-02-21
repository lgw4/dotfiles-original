if [[ ! -v VIRTUAL_ENV ]] && [[ -d "${HOME}/.cargo/bin" ]]; then
    path=("${HOME}/.cargo/bin" $path)
    export PATH
fi
