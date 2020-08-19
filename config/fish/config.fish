set fish_prompt_pwd_dir_length 0

if status is-login
    echo
    fortune
end
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

