""""""""""""""""""""""""""""""
"" Builtin
""

" Tell vimball to get lost.
let g:loaded_vimballPlugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_rrhelper = 1

let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

filetype plugin indent on

""""""""""""""""""""""""""""""
"" Themes
""

" " color
" set background=dark
" " solarized options
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" colorscheme solarized

""""""""""""""""""""""""""""""
"" Backup and swap files
""

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

""""""""""""""""""""""""""""""
"" Plugins
""

" The Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Airline, see `:help airline`
let g:airline_theme            = 'luna'
let g:airline_enable_branch    = 1
let g:airline_enable_syntastic = 1
let g:airline_powerline_fonts  = 1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
