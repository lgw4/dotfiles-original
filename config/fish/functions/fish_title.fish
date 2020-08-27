function fish_title -d "Set terminal application window title"
    printf '%s' $USER
    printf '@'
    printf '%s' (prompt_hostname)
    printf ': '
    printf '%s' (prompt_pwd)
    if test "$LC_TERMINAL" = "iTerm2"
        printf ' — %s×%s' $COLUMNS $LINES
    end
end
