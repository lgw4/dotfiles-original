if ! command -v psql > /dev/null 2>&1; then
    path+=("/usr/local/opt/libpq/bin")
    export PATH
fi
