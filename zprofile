if [[ -d "${HOME}/.zprofile.d" ]]; then
    for f in ${HOME}/.zprofile.d/**/*.zsh(N); do
      [ -r "${f}" ] && source "${f}"
    done
fi
