# -*- mode: sh; -*-

# Look for rustup installed Rust toolchain

if [[ ! -v VIRTUAL_ENV ]]; then
    add_to_path "${HOME}/.cargo/bin"
fi
