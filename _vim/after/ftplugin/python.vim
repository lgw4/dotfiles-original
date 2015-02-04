" ${HOME}/.vim/after/python.vim

setlocal colorcolumn=72,79,99
setlocal expandtab
setlocal shiftround
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=99

let python_highlight_all=1
let g:pymode_folding=0
let g:pymode_options_max_line_length=99
set nonumber

autocmd BufWritePre *.py :call StripTrailingWhitespace()
autocmd BufWritePost *.py call Flake8()

