if [[ ! -v VIRTUAL_ENV ]]; then
    path=("/usr/local/share/npm/bin" $path)
    export PATH
fi
