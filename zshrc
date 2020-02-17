# Lines configured by zsh-newuser-install
HISTFILE=~/.local/share/zsh/histfile
HISTSIZE=10240
SAVEHIST=20480
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/lgw4/.zshrc'

autoload -Uz compinit
compinit
autoload -Uz bashcompinit
bashcompinit
# End of lines added by compinstall
if [[ -d "${HOME}/.zshrc.d" ]]; then
    for f in ${HOME}/.zshrc.d/**/*.zsh(N); do
      [ -r "${f}" ] && source "${f}"
    done
fi
