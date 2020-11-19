# shellcheck shell=bash
if ! command -v psql >/dev/null 2>&1 && [[ -d "${HOMEBREW_PREFIX}/opt/libpq" ]]; then
    export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/libpq/include ${CPPFLAGS}"
    export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/libpq/lib ${LDFLAGS}"
    path_append ${HOMEBREW_PREFIX}/opt/libpq/bin PATH
fi
