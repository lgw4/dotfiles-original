" ${HOME}/.vim/after/python.vim

setlocal colorcolumn=72,79,99
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

let g:flake8_max_line_length=99
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 99
let python_highlight_all=1
set nonumber

autocmd BufWritePre *.py :call StripTrailingWhitespace()
autocmd BufWritePost *.py call Flake8()

