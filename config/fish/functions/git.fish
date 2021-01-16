if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    and test -e /opt/homebrew/bin/git
    function git -d "Apple Silicon git"
        /opt/homebrew/bin/git $argv
    end
end
