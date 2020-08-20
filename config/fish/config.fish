set fish_prompt_pwd_dir_length 0

if status is-login
    echo
    fortune
end

if test -e $HOME/.iterm2_shell_integration.fish
    source $HOME/.iterm2_shell_integration.fish
end

if type -q pipx
    register-python-argcomplete --shell fish pipx | source
end
