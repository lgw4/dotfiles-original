if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    function pip3-x86_64 -d "Rosetta2 pip3"
        /usr/bin/arch -x86_64 pip3 $argv
    end
end
