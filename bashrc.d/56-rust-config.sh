# -*- mode: sh; -*-

# Look for rustup installed Rust toolchain

if [[ ! -v VIRTUAL_ENV ]]; then
    prepend_path "${HOME}/.cargo/bin"
fi
