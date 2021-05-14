# shellcheck shell=bash
# shellcheck disable=SC1090,SC2207
# Enable pyenv
if [[ -d "$HOME"/.pyenv/bin ]]; then
    path_prepend "$HOME"/.pyenv/bin PATH
fi
if command -v pyenv >/dev/null 2>&1; then
    PYENV_COMPLETION="${HOME}/.pyenv/completions/pyenv.bash"
    if [[ ":${PATH}:" != *":${HOME}/.pyenv/shims:"* ]]; then
        eval "$(pyenv init --path)"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
        export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    elif [[ -r "$PYENV_COMPLETION" ]]; then
        source "$PYENV_COMPLETION"
    fi
fi

# Enable pip completion
_pip_completion() {
    COMPREPLY=($(COMP_WORDS="${COMP_WORDS[*]}" \
        COMP_CWORD="${COMP_CWORD}" \
        PIP_AUTO_COMPLETE=1 "${1}" 2>/dev/null))
}
complete -o default -F _pip_completion pip
complete -o default -F _pip_completion pip3
complete -o default -F _pip_completion pip3.7
complete -o default -F _pip_completion pip3.8
complete -o default -F _pip_completion pip3.9
