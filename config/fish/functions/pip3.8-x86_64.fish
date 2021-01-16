if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    function pip3.8-x86_64 -d "Rosetta2 pip3.8"
        /usr/bin/arch -x86_64 pip3.8 $argv
    end
end
