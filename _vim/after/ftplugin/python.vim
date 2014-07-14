" ${HOME}/.vim/after/python.vim

setlocal colorcolumn=72,79,99
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

let g:flake8_max_line_length=99
let python_highlight_all=1

autocmd BufWritePre *.py :call StripTrailingWhitespace()
autocmd BufWritePost *.py call Flake8()

