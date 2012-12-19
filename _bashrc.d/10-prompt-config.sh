# ${HOME}/.bashrc.d/10-prompt-config.sh 

# Terminal title bar
if [ ${TERM} == "linux" ]; then
    TB=""
elif [ ${OS_KERNEL} == "Darwin" ]; then
    TB="\[\033[G\]\[\033]0;\u at \h\007\]"
elif [ ${OS_KERNEL} == "Linux" ]; then
    TB="\[\033[G\]\[\033]0;\u@\h: \w\007\]"
fi

# Custom prompt
export PS1="${TB}\n${R}\u ${D}at ${P}\h ${D}in ${B}\
\W${D} \$(parse_git_branch)\$(parse_svn_status)${D}\n\$ "

