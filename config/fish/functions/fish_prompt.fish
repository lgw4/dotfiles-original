function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    echo
    set_color red
    printf '%s' $USER
    set_color normal
    printf ' at '

    set_color magenta
    echo -n (prompt_hostname)
    set_color normal
    printf ' in '

    set_color blue
    printf '%s' (basename (prompt_pwd))
    set_color normal

    # Line 2
    echo
    if test $VIRTUAL_ENV
        printf "(%s) " (set_color CB4B16)(basename $VIRTUAL_ENV)(set_color normal)
    end
    printf '↪ '
    set_color normal
end
