if ! command -v psql > /dev/null 2>&1; then
    append_path "/usr/local/opt/libpq/bin"
fi
