let s:is_mac = has('mac')
let s:is_cygwin = has('win32unix') || has('win64unix') "treat this as mintty
let s:is_windows = has('win32') || has('win64')
let s:is_msysgit = (has('win32') || has('win64')) && $TERM ==? 'cygwin'
let s:is_msys = ($MSYSTEM =~? 'MINGW\d\d')

" Builtin "{{{

" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible
filetype plugin indent on

" Tell vimball to get lost.
let g:loaded_vimballPlugin    = 1
let g:loaded_getscriptPlugin  = 1
let g:loaded_rrhelper         = 1

let g:python_host_skip_check  = 1
let g:python3_host_skip_check = 1

" works with neovim
" this will place yanked text into the global clipboard
" and allow you to paste from the global clipboard
" without having to use any special registers
" set clipboard=unnamed,unnamedplus
set clipboard=unnamedplus

" "}}}

" Themes "{{{

" " color
" set background=dark
" " solarized options
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" colorscheme solarized

" "}}}

" Backup and swap files "{{{

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

" "}}}

" Plugins "{{{

" The Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Airline, see `:help airline`
let g:airline_theme                        = 'luna'
let g:airline#extensions#branch#enabled    = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts              = 1
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

" easytags
let g:easytags_async          = 1
let g:easytags_file           = '~/.vim/tags'
let g:easytags_dynamic_files  = 2
let g:easytags_updatetime_min = 10000
let g:easytags_by_filetype    = 1

" vim-tags
let g:vim_tags_auto_generate  = 0

" "}}}
