function append_path {
    if [[ -d "${1}" ]] && [[ ! "${PATH}" =~ (^|:)"${1}"(:|$) ]]; then
        path+=("${1}")
        export PATH
    fi
}
