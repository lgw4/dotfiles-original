" vim-plug configuration
"-*- coding: utf-8 -*-
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'altercation/vim-colors-solarized'
Plug 'ambv/black'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call plug#end()
