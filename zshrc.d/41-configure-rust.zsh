# Look for rustup installed Rust toolchain

if [[ ! -v VIRTUAL_ENV ]]; then
    path+=("${HOME}/.cargo/bin")
fi
