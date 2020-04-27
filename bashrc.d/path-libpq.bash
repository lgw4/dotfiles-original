# shellcheck shell=bash
if ! command -v psql > /dev/null 2>&1 && [[ -d "/usr/local/opt/libpq" ]]; then
    export CPPFLAGS="-I/usr/local/opt/libpq/include ${CPPFLAGS}"
    export LDFLAGS="-L/usr/local/opt/libpq/lib ${LDFLAGS}"
    append_path /usr/local/opt/libpq/bin
fi
