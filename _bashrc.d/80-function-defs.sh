# ${HOME}/.bashrc.d/function_defs.sh file

function parse_git_in_rebase {
    if [[ -d .git/rebase-apply ]]; then
        echo " ${Y}REBASING${D}"
    fi
}

function parse_git_dirty {
if [ -n "$(git status --porcelain)" ]; then
        echo "${C}*${D}"
    fi
}

function parse_git_branch {
    branch=$(git branch 2> /dev/null | grep "*" | sed -e s/^..//g)

    if [[ -z ${branch} ]]; then
        return
    fi
    
    echo "${D}on (${G}"${branch}$(parse_git_in_rebase)"${D}) $(parse_git_dirty) "
}

parse_svn_status() {
    local REV=$(                # get svn revision number
        svn info 2>/dev/null | grep Revision | sed -e 's/Revision: //'
    )
    [ "$REV" ] || return        # stop now if not a working copy
                         
    local STATUS=(              # create an array
                             
        # svn status items (second column is always ' ', 'C', or 'M')
        $( svn st | grep '^[^ ][ CM]' | \
                                                 
        # first column only, filter duplicates
        sed -Ee 's/^(.).*$/\1/' | awk 'x[$0]++ == 0' ) 
    )
    echo "(${G}r$REV${D}) ${STATUS[*]} "
}

