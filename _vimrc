" ${HOME}/.vimrc
" -*- coding: utf-8 -*-

" Enable all Vim-specific features
set nocompatible

" Vundle
if filereadable($HOME . "/.vim/config/Vundle.vim")
    source $HOME/.vim/config/Vundle.vim
endif

if has("autocmd")
    filetype plugin indent on
endif

" Enable syntax highlighting
if has('syntax')
    syntax on
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
colorscheme solarized

" Highlight current line
set cursorline
highlight CursorLine cterm=NONE ctermbg=lightgrey

" Search case sensitive only if contains upper-case
set ignorecase smartcase

" Make the comma the leader key
let mapleader=","

" Show trailing whitespace and blank lines
exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list

" Informative statusline
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%03.3b]\ [%02.2B]\ [%l,%v]\ [%p%%]\ [%L]
set laststatus=2

" Enable mouse in terminal mode
if has('mouse')
    set mouse=a
endif

" Enable autoindent
set autoindent

" Set default line ending warning columns
set colorcolumn=79,99
highlight ColorColumn cterm=NONE ctermbg=lightgrey

