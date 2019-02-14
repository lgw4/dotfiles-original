# -*- mode: sh; -*-

if ! command -v psql > /dev/null 2>&1; then
    if [ -d "/usr/local/opt/libpq/bin" ]; then
        export PATH="${PATH}:/usr/local/opt/libpq/bin"
    fi
fi
