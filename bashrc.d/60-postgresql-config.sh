# -*- mode: sh; -*-

if ! command -v psql > /dev/null 2>&1 && [[ -d "/usr/local/opt/libpq/bin" ]]; then
    export PATH="${PATH}:/usr/local/opt/libpq/bin"
fi
