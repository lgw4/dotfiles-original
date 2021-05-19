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
    PYENV_PYTHON3="$(pyenv which python3)"
fi

# Enable virtualenvwrapper
VIRTUALENVWRAPPER=$(command -v virtualenvwrapper.sh)
if [[ -e "${VIRTUALENVWRAPPER}" ]]; then
    if [[ -x "${PYENV_PYTHON3}" ]]; then
        export VIRTUALENVWRAPPER_PYTHON="${PYENV_PYTHON3}"
    elif [[ -x /usr/local/bin/python3 ]]; then
        export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    elif [[ -x /usr/bin/python3 ]]; then
        export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    fi
    if [[ -d "$HOME"/Developer/python ]]; then
        export PROJECT_HOME="${HOME}"/Developer/python
    else
        export PROJECT_HOME="${HOME}"/devel/python
    fi
    export WORKON_HOME="${HOME}"/.local/share/virtualenvs
    export VIRTUALENVWRAPPER_HOOK_DIR="${WORKON_HOME}"/_hooks
    source "$(command -v "$VIRTUALENVWRAPPER")"
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
