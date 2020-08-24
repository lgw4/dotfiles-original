if test (uname) = "Darwin"
    function cdf
        set target (osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
        if test -n "$target"
            cd $target && echo "cd" (pwd)
        else
            echo "No Finder window found." >&2
        end
    end
end
