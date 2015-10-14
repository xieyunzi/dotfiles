" don't bother with vi compatibility
set nocompatible              " be iMproved, required

" enable syntax highlighting
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" install Vundle bundles
if filereadable(expand("./.vimrc.bundles"))
  source ./.vimrc.bundles
  source ./.vimrc.bundles.local
endif

call vundle#end()            " required
filetype plugin indent on    " required
