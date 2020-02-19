if [[ -f "/etc/zshrc" ]]; then
  source "/etc/zshrc"
fi
# Lines configured by zsh-newuser-install
HISTFILE=~/.local/share/zsh/histfile
HISTSIZE=10240
SAVEHIST=20480
setopt appendhistory autocd extendedglob menucomplete nocaseglob nolistambiguous nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle :compinstall filename '/Users/lgw4/.zshrc'

autoload -Uz compinit
fpath+=("${HOME}/.local/share/zsh/zfunc")
compinit
autoload -Uz bashcompinit
bashcompinit
# End of lines added by compinstall
if [[ -d "${HOME}/.zshrc.d" ]]; then
    for f in ${HOME}/.zshrc.d/**/*.zsh(N); do
      [ -r "${f}" ] && source "${f}"
    done
fi
