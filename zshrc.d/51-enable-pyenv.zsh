# Enable pyenv
if [[ ! -v VIRTUAL_ENV ]]; then
    if [[ -d "${HOME}/.pyenv/bin" ]]; then
        path+=("${HOME}/.pyenv/bin")
    fi
    if command -v pyenv > /dev/null 2>&1 && [[ ":${PATH}:" != *":${HOME}/.pyenv/shims:"* ]]; then
        eval "$(pyenv init -)"
        export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    fi
fi
