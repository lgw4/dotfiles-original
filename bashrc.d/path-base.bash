# shellcheck shell=bash
if [[ ! -v VIRTUAL_ENV ]]; then
    # Check for /usr/local/sbin in PATH
    if [[ -d /usr/local/sbin ]]; then
        path_prepend /usr/local/sbin PATH
    fi

    # Check for /usr/local/bin in PATH
    if [[ -d /usr/local/bin ]]; then 
        path_prepend /usr/local/bin PATH
    fi

    # Check for /opt/homebrew (macOS Homebrew installation)
    if [[ -d /opt/homebrew ]]; then
        path_prepend /opt/homebrew/sbin PATH
        path_prepend /opt/homebrew/bin PATH
    fi

    # Add /sbin and /usr/sbin to PATH on Debian systems
    if [[ -e /etc/debian_version ]]; then
        path_prepend /usr/sbin PATH
        path_prepend /sbin PATH
    fi
fi
