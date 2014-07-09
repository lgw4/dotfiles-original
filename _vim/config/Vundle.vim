" Vundle configuration
"-*- coding: utf-8 -*-

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'nvie/vim-flake8'
Plugin 'rking/ag.vim'
Plugin 'Rykka/riv.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
if v:version > 703 || v:version == 703 && has('patch584')
    Plugin 'Valloric/YouCompleteMe'
else
    Plugin 'ervandew/supertab'
endif

call vundle#end()

