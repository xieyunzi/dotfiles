"
" vim setup
" define global variables
" load separated vimscript files
"
" note: learn from janus and other project, but i need simple and clean
" settings
"

" Define paths
let g:home_path = expand("~")
let g:vim_path = expand("~/.vim")
let g:xdg_path = expand("~/.config")

" Source configuration files
exe 'source ' . g:vim_path . '/janus/vim/vimrc'
exe 'source ' . g:xdg_path . '/nvim/settings.vim'
