" ${HOME}/.gvimrc
if has("mac")
    set guifont=Menlo\ Regular:h11
else
    set guifont=Ubuntu\ Mono\ 11
endif

" Get rid of scrollbars. Why it has to be this way, I have no idea.
set guioptions+=LlRrb
set guioptions-=LlRrb

set guioptions-=T
set columns=120
set lines=40

