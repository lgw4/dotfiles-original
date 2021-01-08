function fish_title -d "Set terminal application window title"
    printf '%s' $USER
    printf '@'
    printf '%s' (prompt_hostname)
    printf ': '
    printf '%s' (prompt_pwd)
end
