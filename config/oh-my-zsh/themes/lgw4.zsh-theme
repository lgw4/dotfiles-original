setopt nopromptbang prompt{cr,percent,sp,subst}

export VIRTUAL_ENV_DISABLE_PROMPT=1

_prompt_venv() {
  if [[ -n ${VIRTUAL_ENV} ]] echo " (%F{166}${VIRTUAL_ENV:t}%f)"
}

PROMPT=$'
%F{red}%n%f at %F{magenta}%m%f in %F{blue}%c%f $(_prompt_venv)
%(!.#.$) '
