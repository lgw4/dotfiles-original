" ${HOME}/.vim/ftplugin/python.vim

" Disable rope and use jedi instead
let g:pymode_rope=0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Support virtualenvs
let g:pymode_virtualenv = 1

" Disable folding
let g:pymode_folding=0

" Set line length
let g:pymode_options_max_line_length=99

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=99
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

