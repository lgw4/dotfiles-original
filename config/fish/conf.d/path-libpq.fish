if not type -q psql && test -e $HOMEBREW_ROOT/opt/libpq
    set -x CPPFLAGS -I$HOMEBREW_ROOT/opt/libpq/include $CPPFLAGS
    set -x LDFLAGS -L$HOMEBREW_ROOT/opt/libpq/lib $LDFLAGS
    path_prepend $HOMEBREW_ROOT/opt/libpq/bin
end
