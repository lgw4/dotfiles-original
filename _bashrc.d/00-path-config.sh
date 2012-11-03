# ${HOME}/.bashrc.d/00-path-config.sh 

# Remove /usr/local/bin from PATH
export PATH=${PATH/:\/usr\/local\/bin/}

# Prepend /usr/local hierarcy to PATH
export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"

# Prepend $HOME/.local/bin to PATH
if [ -d ${HOME}/.local/bin ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

