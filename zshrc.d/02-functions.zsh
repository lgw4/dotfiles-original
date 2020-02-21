function add_to_path {
    if [[ -d "${1}" ]] && [[ ! "${PATH}" =~ (^|:)"${1}"(:|$) ]]; then
        path=("${1}" $path)
        export PATH
    fi
}