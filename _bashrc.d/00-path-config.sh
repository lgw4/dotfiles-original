# ${HOME}/.bashrc.d/00-path-config.sh

# MacPorts on OS X
if [ -d "/opt/local/bin" ]; then
    export PATH="/opt/local/bin:/opt/local/sbin:${PATH}"
fi

# Add /sbin and /usr/sbin to PATH on Debian systems
if [ -e /etc/debian_version ]; then
    export PATH="${PATH}:/sbin:/usr/sbin"
fi

# Prepend $HOME/.local/bin to PATH
if [ -d "${HOME}/.local/bin" ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi
