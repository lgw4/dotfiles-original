# shellcheck shell=bash
if [[ ! -r "$HOME"/.gitconfig ]] && [[ "$(command -v git)" ]]; then
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.co checkout
    git config --global alias.dump "cat-file -p"
    git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
    git config --global alias.new '!git init && git symbolic-ref HEAD refs/heads/main'
    git config --global alias.st status
    git config --global alias.type "cat-file -t"
    git config --global color.ui auto
    git config --global core.editor vim
    git config --global core.excludesfile ~/.gitignore_global
    git config --global core.quotepath false
    git config --global core.trustctime false
    if [[ "$OSTYPE" == darwin* ]]; then
        git config --global credential.helper osxkeychain
    elif [[ -r /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring ]]; then
        git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
    else
        git config --global credential.helper store
    fi
    git config --global fetch.fsckObjects true
    git config --global github.user lgw4
    git config --global init.defaultBranch main
    git config --global protocol.git never
    git config --global protocol.http never
    git config --global pull.rebase false
    git config --global receive.fsckObjects true
    git config --global transfer.fsckObjects true
    git config --global user.email lgw4@icloud.com
    git config --global user.name "Chip Warden"
    chmod 600 "$HOME"/.gitconfig
fi
