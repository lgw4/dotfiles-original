# -*- mode: sh; -*-

# Look for rustup installed Rust toolchain
if [[ ! -v VIRTUAL_ENV ]] && [[ -d "${HOME}/.cargo/bin" ]] ; then
    export PATH="${HOME}/.cargo/bin:${PATH}"
fi
