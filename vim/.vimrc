"
" vim setup
" define global variables
" load separated vimscript files
"
" note: learn from janus and other project, but i need simple and clean
" settings
"

" Define paths
let g:vim_path = expand("~/.vim")

" Source configuration files
exe 'source ' . g:vim_path . '/settings.vim'
exe 'source ' . g:vim_path . '/plugins.vim'
