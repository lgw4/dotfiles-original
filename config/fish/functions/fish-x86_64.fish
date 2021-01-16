if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    function fish-x86_64 -d "Rosetta2 Fish shell"
        /usr/bin/arch -x86_64 /usr/local/bin/fish $argv
    end
end
