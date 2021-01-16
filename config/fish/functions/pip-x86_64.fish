if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    function pip-x86_64 -d "Rosetta2 pip"
        /usr/bin/arch -x86_64 pip $argv
    end
end
