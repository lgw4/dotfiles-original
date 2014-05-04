" Vundle configuration
"-*- coding: utf-8 -*-

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

" Plugins
Plugin 'hdima/python-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'croaky/vim-colors-github'
Plugin 'nvie/vim-flake8'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-markdown'
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'

call vundle#end()

