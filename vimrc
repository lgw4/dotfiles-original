" ${HOME}/.vimrc
" -*- coding: utf-8 -*-

" Enable all Vim-specific features
set nocompatible

" vim-plug
if filereadable(glob("~/.vim/config/vim-plug.vim"))
    source ~/.vim/config/vim-plug.vim
endif

if has("autocmd")
    filetype plugin indent on
endif

" Enable syntax highlighting
if has("syntax")
    syntax enable
endif

"  Save files in UTF-8
set fileencoding=utf8

" Remember marks/undo for unsaved buffers
set hidden

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set default tab stop
set tabstop=4

" Spaces inserted for indentation
set shiftwidth=4

" Expand tabs as spaces
set expandtab

" Set soft tabstop
set softtabstop=4

" Activate TAB auto-completion for file paths
set wildmode=longest,list

" Improve statusline tab completion
set wildmenu

" Keep 1024 lines of command line history
set history=1024

" Show the cursor position at all times
set ruler

" Display incomplete commands
set showcmd

" Make search wrap around the file
set wrapscan

" Colorscheme
set background=light
let g:solarized_termtrans=1
let g:solarized_termcolors=256
silent! colorscheme solarized

" Highlight current line
set cursorline
highlight CursorLine cterm=NONE ctermbg=187

" Search case sensitive only if contains upper-case
set ignorecase smartcase

" Make the comma the leader key
let mapleader=","

" Informative statusline
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }

" Enable mouse in terminal mode
if has('mouse')
    set mouse=a
endif

" Enable autoindent
set autoindent

" Line numbering
set number
set relativenumber

" Better line wrapping
if has("linebreak") && exists("&breakindent")
    set linebreak
    set breakindent
    set showbreak=\ \ \ \ 
endif

" Set default line ending warning columns
set colorcolumn=79,99
highlight ColorColumn cterm=NONE ctermbg=187

" Functions
if filereadable(glob("~/.vim/config/functions.vim"))
    source ~/.vim/config/functions.vim
endif

