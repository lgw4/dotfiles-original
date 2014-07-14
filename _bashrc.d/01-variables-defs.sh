# ${HOME}/.bashrc.d/00-variables-defs.sh

# Set architecture flags
if [ "${OS_KERNEL}" == "Darwin" ]; then
    export ARCHFLAGS="-arch x86_64"
fi

# Make MacVim the default visual editor, if available
if [ "${OS_KERNEL}" == "Darwin" ] && [ `command -v mvim` ] ; then
    export VISUAL="mvim --nofork"
fi

export EDITOR="vim"

# Enable Homebrew GitHub API token, if available
if [ "${OS_KERNEL}" == "Darwin" ] \
    && [ -e "${HOME}/.homebrew/00-homebrew-github-api-token.sh" ]; then
        source "${HOME}/.homebrew/00-homebrew-github-api-token.sh"
fi

# Homebrew cask options
if [ "${OS_KERNEL}" == "Darwin" ]; then
    app='--appdir="/Applications"'
    prefp='--prefpanedir="/Library/PreferencePanes"'
    ql='--qlplugindir="/Library/QuickLook"'
    widget='--widgetdir="/Library/Widgets"'
    font='--fontdir="/Library/Fonts"'
    input_m='--input_methoddir="/Library/Input Methods"'
    screen_s='--screen_saverdir="/Library/Screen Savers"'
    export HOMEBREW_CASK_OPTS="${app} ${prefp} ${ql} ${widget} ${font} ${input_m} ${screen_s}"
fi

