# shellcheck shell=bash
if [[ ! -v VIRTUAL_ENV ]]; then
    # Check for /usr/local/sbin in PATH
    path_prepend /usr/local/sbin PATH

    # Check for /usr/local/bin in PATH
    path_prepend /usr/local/bin PATH

    # Add /sbin and /usr/sbin to PATH on Debian systems
    if [[ -e /etc/debian_version ]]; then
        path_prepend /usr/sbin PATH
        path_prepend /sbin PATH
    fi
fi
