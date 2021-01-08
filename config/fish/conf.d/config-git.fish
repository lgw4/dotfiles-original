if not test -r "$HOME"/.gitconfig && type -q git
    git config --global user.name "Chip Warden"
    git config --global user.email "lgw4@icloud.com"
    git config --global init.defaultBranch main
    git config --global color.ui auto
    git config --global core.excludesfile ~/.gitignore_global
    git config --global core.quotepath false
    git config --global core.trustctime false
    git config --global core.editor vim
    git config --global pull.rebase false
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.co checkout
    git config --global alias.dump "cat-file -p"
    git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
    git config --global alias.new '!git init && git symbolic-ref HEAD refs/heads/main'
    git config --global alias.st status
    git config --global alias.type "cat-file -t"
    git config --global github.user lgw4
    if test (uname) = "Darwin"
        git config --global credential.helper osxkeychain
    else if test -r /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
        git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
    else
        git config --global credential.helper store
    end
    chmod 600 "$HOME"/.gitconfig
end
