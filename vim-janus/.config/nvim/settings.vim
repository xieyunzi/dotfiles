" Leader `<space>`
let mapleader = " "

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
syntax on               " enable syntax

" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase   " be sensitive when there's a capital letter
set incsearch

" Formatting
set backspace=indent,eol,start  " more powerful backspacing

set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

" Visual
set number  " Line numbers on
set novisualbell  " No blinking
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
set foldenable " Turn on folding

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

" Display extra whitespace
" set list listchars=tab:»·,trail:·,nbsp:·

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
" https://github.com/neovim/neovim/issues/3097
if exists($DISPLAY) && (executable('pbcopy') || executable('xclip') || executable('xsel')) && has('clipboard')
  set clipboard=unnamedplus
endif

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

" file encoding https://www.zhihu.com/question/22363620
" set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" Plugins "{{{

" The Silver Searcher, ctrlp
if executable('ag')
  let g:ackprg = 'ag --vimgrep'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore ".git" -g ""'

  " else let g:ctrlp_show_hidden = 1
endif

" https://github.com/itchyny/lightline.vim.git
" http://www.blaenkdenum.com/posts/a-simpler-vim-statusline/
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ], ['ctrlpmark'] ],
      \   'right': [ [ 'lineinfo_percent', 'syntastic' ], [ 'fileencoding', 'fileformat'] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'relativepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo_percent' ], [ 'fileencoding', 'fileformat'] ]
      \ },
      \ 'separator': { 'left': "", 'right': "" },
      \ 'subseparator': { 'left': "|", 'right': "|" },
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'V-LINE',
      \   'c' : 'COMMAND',
      \   "\<C-v>": 'V-BLOCK',
      \   's' : 'S',
      \   'S' : 'S-LINE',
      \   "\<C-s>": 'S-BLOCK',
      \   '?': '      '
      \ },
      \ 'component': {
      \   'filename': '%t',
      \   'relativepath': '%f',
      \   'lineinfo_percent': '⚓️  %l:%-v | %p%%'
      \ }
      \ }

" easytags
let g:easytags_async          = 1
let g:easytags_file           = '~/.vim/tags'
let g:easytags_dynamic_files  = 2
let g:easytags_updatetime_min = 10000
let g:easytags_by_filetype    = 1

" vim-tags
let g:vim_tags_auto_generate  = 0

" deoplete
" https://github.com/Shougo/deoplete.nvim.git
if has("nvim")
  let g:deoplete#enable_at_startup = 1
end

" https://github.com/christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <a-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <a-j> :TmuxNavigateDown<cr>
nnoremap <silent> <a-k> :TmuxNavigateUp<cr>
nnoremap <silent> <a-l> :TmuxNavigateRight<cr>
nnoremap <silent> <a-\> :TmuxNavigatePrevious<cr>

" Maps resizing a window split, use _ instead - for easy to type
nnoremap <silent> _ <C-W>-<C-W>-<C-W>-
nnoremap <silent> + <C-W>+<C-W>+<C-W>+
nnoremap <silent> <M-<> <C-W><<C-W><<C-W><<C-W><<C-W><
nnoremap <silent> <M->> <C-W>><C-W>><c-w>><c-w>><c-w>>

" fzf
set rtp+=/usr/local/opt/fzf

" `vim-easyclip` shadow mark feature
" https://github.com/svermeulen/vim-easyclip/blob/master/doc/easyclip.txt
nnoremap gm m

" vim-bookmarks
nmap <Leader>m <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>a <Plug>BookmarkShowAll
nmap <Leader>nonej <Plug>BookmarkNext
nmap <Leader>nonek <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll
nmap <Leader>nonekk <Plug>BookmarkMoveUp
nmap <Leader>nonejj <Plug>BookmarkMoveDown

let g:bookmark_sign = '❥'

" https://github.com/Shougo/unite.vim
nnoremap <silent><leader>i :Unite -start-insert<CR>

" ultisnips & YouCompleteMe "{{{
" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme

" https://github.com/Valloric/YouCompleteMe.
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" https://github.com/SirVer/ultisnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" "}}}

" "}}}
