# -*- mode: sh; -*-

if ! command -v psql > /dev/null 2>&1; then
    add_to_path "/usr/local/opt/libpq/bin"
fi
