if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    and test -e /opt/homebrew/bin/starship
    function starship -d "Apple Silicon starship"
        /opt/homebrew/bin/starship $argv
    end
end
