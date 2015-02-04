" ${HOME}/.vim/after/python.vim

let g:pymode_options=0
let g:pymode_folding=0
let g:pymode_options_max_line_length=99

setlocal colorcolumn=72,79,99
setlocal commentstring=#%s
setlocal complete+=t
setlocal define=^\s*\\(def\\\\|class\\)
setlocal expandtab
setlocal formatoptions-=t
setlocal shiftround
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=99
setlocal nonumber

autocmd BufWritePre *.py :call StripTrailingWhitespace()
autocmd BufWritePost *.py call Flake8()
