setopt nopromptbang prompt{cr,percent,sp,subst}

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats ' (%F{yellow}%b%f)'
zstyle ':vcs_info:*' enable git

export VIRTUAL_ENV_DISABLE_PROMPT=1

_prompt_venv() {
  if [[ -n ${VIRTUAL_ENV} ]] echo " (%F{166}${VIRTUAL_ENV:t}%f)"
}

PROMPT=$'
%F{red}%n%f at %F{magenta}%m%f in %F{blue}%c%f$vcs_info_msg_0_%f$(_prompt_venv)
%(!.#.$) '
