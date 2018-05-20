# -*- mode: sh; -*-

if [[ "${LOGIN_SHELL}" == "True" ]]; then
    if [[ -d "/opt/local/packer" ]]; then
        export PATH="${PATH}:/opt/local/packer"
    fi
fi
