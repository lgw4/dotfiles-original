" ${HOME}/.vimrc
" -*- coding: utf-8 -*-

" Enable all Vim-specific features
set nocompatible


" Enable Pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()

" Enable filetype loading actions
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
colorscheme github

" Highlight current line
set cursorline                  
highlight CursorLine cterm=NONE ctermbg=lightmagenta

" Search case sensitive only if contains upper-case
set ignorecase smartcase        

" Make the comma the leader key
let mapleader=","

" Relative line numbering
set relativenumber
highlight CursorLineNr cterm=NONE ctermbg=lightmagenta
" Informative statusline
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%03.3b]\ [%02.2B]\ [%l,%v]\ [%p%%]\ [%L]
set laststatus=2
" highlight StatusLine cterm=NONE ctermbg=lightmagenta

" Enable mouse in terminal mode
if has('mouse')
    set mouse=a                   
endif

" Enable autoindent
set autoindent

" Set default line ending warning columns
set colorcolumn=87,95
highlight ColorColumn cterm=NONE ctermbg=lightmagenta

" Supertab
let g:SuperTabDefaultCompletionType = "context"

