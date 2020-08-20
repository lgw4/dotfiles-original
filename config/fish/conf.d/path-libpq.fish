if not type -q psql && test -d /usr/local/opt/libpq
    set -x CPPFLAGS -I/usr/local/opt/libpq/include $CPPFLAGS
    set -x LDFLAGS -L/usr/local/opt/libpq/lib $LDFLAGS
    path_prepend /usr/local/opt/libpq/bin
end
