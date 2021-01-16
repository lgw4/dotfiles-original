if not type -q psql
    and test -d "$HOMEBREW_ROOT/opt/libpq"
    path_prepend $HOMEBREW_ROOT/opt/libpq/bin
end
