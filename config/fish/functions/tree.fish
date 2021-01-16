if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    and test -e /opt/homebrew/bin/tree
    function tree -d "Apple Silicon tree"
        /opt/homebrew/bin/tree $argv
    end
end
