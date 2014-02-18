# ${HOME}/.bashrc.d/00-path-config.sh

# Remove /usr/local/bin and prepend /usr/local hierarchy to PATH
if [ `uname` = "Darwin" ]; then
    export PATH=${PATH/:\/usr\/local\/bin/}
    export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"
fi

# Prepend $HOME/.local/bin to PATH
if [ -d ${HOME}/.local/bin ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

