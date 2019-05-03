# -*- mode: sh; -*-

if [[ ! -v VIRTUAL_ENV ]]; then
    # Check for /usr/local/sbin in PATH
    add_to_path "/usr/local/sbin"

    # Check for /usr/local/bin in PATH
    add_to_path "/usr/local/bin"

    # Add /sbin and /usr/sbin to PATH on Debian systems
    if [[ -e "/etc/debian_version" ]]; then
        add_to_path "/usr/sbin"
        add_to_path "/sbin"
    fi
fi
