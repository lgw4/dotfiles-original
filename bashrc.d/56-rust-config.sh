# -*- mode: sh; -*-

# Look for rustup installed Rust toolchain
CARGO_BIN="${HOME}/.cargo/bin"
if [[ ! -v VIRTUAL_ENV ]] && [[ -d "${CARGO_BIN}" ]] && [[ ":${PATH}:" != *":${CARGO_BIN}:"* ]]; then
    export PATH="${CARGO_BIN}:${PATH}"
fi
