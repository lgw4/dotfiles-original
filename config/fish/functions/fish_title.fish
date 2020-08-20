function fish_title
    printf '%s' $USER
    printf '@'
    printf '%s' (prompt_hostname)
    printf ': '
    printf '%s' (prompt_pwd)
end
