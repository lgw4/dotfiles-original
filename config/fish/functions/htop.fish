if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    and test -e /opt/homebrew/bin/htop
    function htop -d "Apple Silicon htop"
        /opt/homebrew/bin/htop $argv
    end
end
