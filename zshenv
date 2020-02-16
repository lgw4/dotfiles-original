if [[ -d "${HOME}/.zshenv.d" ]]; then
  for f in ${HOME}/.zshenv.d/**/*.zsh(N); do
    [ -r "${f}" ] && source "${f}"
  done
fi