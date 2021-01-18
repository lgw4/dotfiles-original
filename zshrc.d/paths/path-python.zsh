#!/usr/bin/env zsh
# Enable pyenv
if [[ -d "$HOME"/.pyenv ]]; then
    export PYENV_ROOT="$HOME"/.pyenv
fi

if [[ -d "$PYENV_ROOT"/bin ]]; then
    path_prepend "$PYENV_ROOT"/bin
fi

if command -v pyenv >/dev/null 2>&1 && [[ ":${PATH}:" != *":${HOME}/.pyenv/shims:"* ]]; then
    eval "$(pyenv init -)"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    # Run under Rosetta2 on Apple Silicon
    if [[ "${OSTYPE}" == darwin* ]] && [[ "$(arch)" == "arm64" ]]; then
        pyenv-x86_64 () {
            /usr/bin/arch -x86_64 pyenv "$@"
        }
        complete -o default -F _pyenv pyenv-x86_64
    fi
fi

# Run under Rosetta2 on Apple Silicon
if [[ "$OSTYPE" == darwin* ]] && [[ "$(arch)" == "arm64" ]]; then
    alias pip-x86_64='/usr/bin/arch -x86_64 pip'
    alias pip3-x86_64='/usr/bin/arch -x86_64 pip3'
    alias pip3.7-x86_64='/usr/bin/arch -x86_64 pip3.7'
    alias pip3.8-x86_64='/usr/bin/arch -x86_64 pip3.8'
    alias pip3.9-x86_64='/usr/bin/arch -x86_64 pip3.9'
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
complete -o default -F _pip_completion pip-x86_64
complete -o default -F _pip_completion pip3-x86_64
complete -o default -F _pip_completion pip3.7-x86_64
complete -o default -F _pip_completion pip3.8-x86_64
complete -o default -F _pip_completion pip3.9-x86_64
