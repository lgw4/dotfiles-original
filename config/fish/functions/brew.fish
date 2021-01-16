if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    and test -e /usr/local/bin/brew
    function brew -d "Rosetta2 Homebrew"
        /usr/bin/arch -x86_64 /usr/local/bin/brew $argv
    end
end
