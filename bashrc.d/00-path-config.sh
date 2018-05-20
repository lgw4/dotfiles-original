# -*- mode: sh; -*-

if [[ "${LOGIN_SHELL}" == "True" ]]; then
    # Check for /usr/local/sbin in PATH
    if [[ ":${PATH}:" != *":/usr/local/sbin:"* ]]; then
        export PATH="/usr/local/sbin:${PATH}"
    fi

    # Check for /usr/local/bin in PATH
    if [[ ":${PATH}:" != *":/usr/local/bin:"* ]]; then
        export PATH="/usr/local/bin:${PATH}"
    fi

    # Add /sbin and /usr/sbin to PATH on Debian systems
    if [[ -e "/etc/debian_version" ]]; then
        export PATH="${PATH}:/sbin:/usr/sbin"
    fi

    # Prepend $HOME/.local/bin to PATH
    if [[ -d "${HOME}/.local/bin" ]]; then
        export PATH="${HOME}/.local/bin:${PATH}"
    fi
fi
