# ${HOME}/.bashrc.d/00-variables-defs.sh

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Make subl editor, if available
if `which subl > /dev/null`; then
    export EDITOR="subl -n -w"
else
    export EDITOR="vim"
fi

# Enable Homebrew GitHub API token, if available
if [ ${OS_KERNEL} == "Darwin" ]; then
    if [ -e ${HOME}/.homebrew/00-homebrew-github-api-token.sh ]; then
        source ${HOME}/.homebrew/00-homebrew-github-api-token.sh
    fi
fi

# Homebrew cask options
if [ ${OS_KERNEL} == "Darwin" ]; then
    app='--appdir="/Applications"'
    prefp='--prefpanedir="/Library/PreferencePanes"'
    ql='--qlplugindir="/Library/QuickLook"'
    widget='--widgetdir="/Library/Widgets"'
    font='--fontdir="/Library/Fonts"'
    input_m='--input_methoddir="/Library/Input Methods"'
    screen_s='--screen_saverdir="/Library/Screen Savers"'
    export HOMEBREW_CASK_OPTS="${app} ${prefp} ${ql} ${widget} ${font} ${input_m} ${screen_s}"
fi

