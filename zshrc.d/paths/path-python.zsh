#!/usr/bin/env zsh
# Enable pyenv
if [[ ! -v VIRTUAL_ENV ]]; then
    if [[ -d "${HOME}/.pyenv/bin" ]]; then
        typeset -U PATH path
        path=("${HOME/.pyenv/bin}" "$path[@]")
        export PATH
    fi
    if (($ + commands[pyenv])) && [[ -z '${path[(r)"${HOME}/.pyenv/shims"]}' ]]; then
        eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"
        export PYENV_VIRTUALENV_DISABLE_PROMPT=1
        # Big Sur "fix". Revisit this soon.
        if [[ $OSTYPE == darwin* ]]; then
            if [[ "$(arch)" == "arm64" ]]; then
                alias pyenv='SYSTEM_VERSION_COMPAT=1 arch -x86_64 pyenv'
            else
                alias pyenv='SYSTEM_VERSION_COMPAT=1 pyenv'
            fi
        fi
    fi
fi

if [[ $OSTYPE == darwin* ]]; then
    if [[ "$(arch)" == "arm64" ]]; then
        alias pip='SYSTEM_VERSION_COMPAT=1 arch -x86_64 pip'
        alias pip3='SYSTEM_VERSION_COMPAT=1 arch -x86_64 pip3'
        alias pip3.7='SYSTEM_VERSION_COMPAT=1 arch -x86_64 pip3.7'
        alias pip3.8='SYSTEM_VERSION_COMPAT=1 arch -x86_64 pip3.8'
        alias pip3.9='SYSTEM_VERSION_COMPAT=1 arch -x86_64 pip3.9'
    else
        alias pip='SYSTEM_VERSION_COMPAT=1 pip'
        alias pip3='SYSTEM_VERSION_COMPAT=1 pip3'
        alias pip3.7='SYSTEM_VERSION_COMPAT=1 pip3.7'
        alias pip3.8='SYSTEM_VERSION_COMPAT=1 pip3.8'
        alias pip3.9='SYSTEM_VERSION_COMPAT=1 pip3.9'
    fi
fi

# Enable pip completion
_pip_completion() {
    COMPREPLY=($(COMP_WORDS="${COMP_WORDS[*]}" \
        COMP_CWORD="$COMP_CWORD" \
        PIP_AUTO_COMPLETE=1 "$1"))
}
complete -o default -F _pip_completion pip
complete -o default -F _pip_completion pip3
complete -o default -F _pip_completion pip3.7
complete -o default -F _pip_completion pip3.8
complete -o default -F _pip_completion pip3.9
