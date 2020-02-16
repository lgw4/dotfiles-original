setopt nopromptbang prompt{cr,percent,sp,subst}

_git_status() {
    if [[ ${OS_KERNEL} == "Darwin" ]] && command -v brew > /dev/null 2>&1; then
        if [[ -f "/usr/local/etc/bash_completion.d/git-prompt.sh" ]]; then
            GIT_PS1_SHOWDIRTYSTATE=1
            source "/usr/local/etc/bash_completion.d/git-prompt.sh"
            GIT_PROMPT=$(__git_ps1 %s)
        fi
    elif [[ ${OS_KERNEL} == "Linux" ]]; then
        if [[ -f "/etc/bash_completion.d/git-prompt" ]]; then
            GIT_PS1_SHOWDIRTYSTATE=1
            source "/etc/bash_completion.d/git-prompt"
            GIT_PROMPT=$(__git_ps1 %s)
        fi
    fi
    if [[ ${GIT_PROMPT} ]] echo " (%F{yellow}${GIT_PROMPT}%f)"
}
export VIRTUAL_ENV_DISABLE_PROMPT=1

_prompt_venv() {
  if [[ -n ${VIRTUAL_ENV} ]] echo " (%F{166}${VIRTUAL_ENV:t}%f)"
}

PROMPT=$'
%F{red}%n%f at %F{magenta}%m%f in %F{blue}%c%f$(_git_status)$(_prompt_venv)
%(!.#.$) '
