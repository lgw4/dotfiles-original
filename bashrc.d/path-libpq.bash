# shellcheck shell=bash
if ! command -v psql > /dev/null 2>&1; then
    path_append /usr/local/opt/libpq/bin PATH
fi
