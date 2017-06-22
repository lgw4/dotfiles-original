" ${HOME}/.vim/after/ftplugin/python.vim

setlocal colorcolumn=72,79,99
setlocal expandtab
setlocal shiftround
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=99

autocmd BufWritePre *.py :call StripTrailingWhitespace()
autocmd BufWritePost *.py call Flake8()
