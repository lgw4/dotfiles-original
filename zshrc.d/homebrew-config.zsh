if command -v brew > /dev/null 2>&1; then
    export HOMEBREW_PREFIX="$(brew --prefix)"
    export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
fi