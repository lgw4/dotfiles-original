" ${HOME}/.vimrc

call pathogen#infect()          " Enable Pathogen

set nocompatible		        " Enable all Vim features

set hidden                      " Remember marks/undo for unsaved buffers
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set tabstop=4			        " Set default tab stop
set shiftwidth=4		        " Spaces inserted for indentation
set expandtab			        " Expand tabs as spaces
set wildmode=longest,list       " Activate TAB auto-completion for file paths 
set wildmenu                    " Improve statusline tab completion
set history=1024                " Keep 1024 lines of command line history
set ruler                       " Show the cursor position at all times
set showcmd                     " Display incomplete commands
set wrapscan                    " Make search wrap around the file
set cursorline                  " Highlight current line
set ignorecase smartcase        " Search case sensitive only if contains upper-case

let mapleader=","

" Informative statusline
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%03.3b]\ [%02.2B]\ [%l,%v]\ [%p%%]\ [%L]
set laststatus=2

" CtrlP plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

if has('syntax') 
    syntax on                     " Enable syntax highlighting
endif

if has('mouse')
    set mouse=a                   " Enable mouse in terminal mode
endif

" Solarized
set background=light

let g:solarized_termcolors=256
let g:solarized_termtrans=1

colorscheme solarized


if has("autocmd")
    filetype plugin indent on
endif

set autoindent

set colorcolumn=87,95
