# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10240
SAVEHIST=20480
setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/lgw4/.zshrc'

fpath+=("${HOME}/.local/share/zsh/functions")
autoload -Uz compinit
compinit
# End of lines added by compinstall
for f in ${HOME}/.zshrc.d/**/*.zsh(N); do
    [[ -r "${f}" ]] && source "${f}"
done
