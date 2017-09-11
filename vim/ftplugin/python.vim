" ${HOME}/.vim/ftplugin/python.vim

" Enable pymode
let g:pymode = 1

" Disable rope and use jedi instead
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Support virtualenvs
let g:pymode_virtualenv = 1

" Disable folding
let g:pymode_folding = 0

" Set line length
let g:pymode_options_max_line_length = 99

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

au BufNewFile,BufRead *.py
    \ set tabstop=4       |
    \ set softtabstop=4   |
    \ set shiftwidth=4    |
    \ set textwidth=99    |
    \ set expandtab       |
    \ set autoindent      |
    \ set fileformat=unix 

