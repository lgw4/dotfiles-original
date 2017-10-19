function fish_prompt
	if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    echo
    set_color red 
    printf '%s' (whoami)
    set_color normal
    printf ' at '

    set_color magenta
    echo -n (prompt_hostname)
    set_color normal
    printf ' in '

    set_color blue
    printf '%s' (prompt_pwd)
    set_color normal
    if test (__fish_git_prompt)
        printf ' on'
        set_color green
        printf '%s' (__fish_git_prompt)
        set_color cyan
        printf ' %s' (__fish_git_prompt_dirty)
        set_color normal
    end
    # Line 2
    echo
    if test $VIRTUAL_ENV
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    printf '↪ '
    set_color normal
end
