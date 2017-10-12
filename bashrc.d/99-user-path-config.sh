# ${HOME}/.bashrc.d/99-user-path-config.sh

# Prepend $HOME/.local/bin to PATH
if [ -d "${HOME}/.local/bin" ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi