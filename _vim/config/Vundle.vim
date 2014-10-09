" Vundle configuration
"-*- coding: utf-8 -*-

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'nvie/vim-flake8'
Plugin 'rking/ag.vim'
Plugin 'Rykka/riv.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'ervandew/supertab'

call vundle#end()

