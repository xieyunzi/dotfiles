let s:plugins = filereadable(expand("~/.vim/autoload/plug.vim", 1))

if !s:plugins "{{{

fun! InstallPlug() "bootstrap plug.vim on new systems
    silent call mkdir(expand("~/.vim/autoload", 1), 'p')
    exe '!curl -fLo '.expand("~/.vim/autoload/plug.vim", 1).' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endfun

else

call plug#begin('~/.vim/bundle')

Plug 'tomasr/molokai'

Plug 'ludovicchabant/vim-gutentags'

Plug 'tommcdo/vim-exchange'
Plug 'kopischke/vim-fetch'

Plug 'https://github.com/justinmk/vim-ipmotion.git'
Plug 'https://github.com/justinmk/vim-dirvish.git'
Plug 'https://github.com/justinmk/vim-gtfo.git'

Plug 'https://github.com/justinmk/vim-sneak.git'
let g:sneak#streak = 1
let g:sneak#use_ic_scs = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
let g:sneak#target_labels = ";sftunq/SFGHLTUNRMQZ?0"

Plug 'https://github.com/justinmk/vim-syntax-extra.git'
Plug 'https://github.com/justinmk/vim-matchparenalways.git'

if executable("tmux")
Plug 'tpope/vim-tbone'
Plug 'wellle/tmux-complete.vim'
let g:tmuxcomplete#trigger = ''
endif

Plug 'tpope/vim-characterize'
" Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-scriptease'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'
let g:surround_indent = 1
let g:surround_no_insert_mappings = 1

Plug 'tpope/vim-dispatch'
nnoremap !m :<c-u>Make<cr>
nnoremap !] :<c-u>Start! ctags -R *<cr>
" ways to run external commands in vim: https://gist.github.com/sjl/b9e3d9f821e57c9f96b3
nnoremap !t :<c-u>Trun TEST_FILE=<c-r>% make functionaltest<cr>
nnoremap !T :<c-u>Make unittest<cr>

nnoremap <silent> yr  :<c-u>set opfunc=<sid>tmux_run_operator<cr>g@
xnoremap <silent> R   :<c-u>call <sid>tmux_run_operator(visualmode(), 1)<CR>
nnoremap <silent> yrr V:<c-u>call <sid>tmux_run_operator(visualmode(), 1)<CR>
func! s:tmux_run_operator(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  let isvisual = a:0

  let lines = isvisual ? getline("'<", "'>") : getline("'[", "']")
  if a:type !=# 'line' && a:type !=# 'V'
    let startcol  = isvisual ? col("'<") : col("'[")
    let endcol    = isvisual ? col("'>")-2 : col("']")
    let lines[0]  = lines[0][startcol-1 : ]
    let lines[-1] = lines[-1][ : endcol-1]
  endif

  call s:tmux_run(join(lines))

  let &selection = sel_save
endf
"Sends `cmd` to the bottom-right pane and optionally runs it.
func! s:tmux_run(creatnew, run, cmd) abort
  "Create a new pane if demanded or if we are _in_ the target pane.
  if a:creatnew || tbone#pane_id(".") == tbone#pane_id("bottom-right")
    Tmux split-window -d -p 33
  endif
  call tbone#send_keys("bottom-right",
        \"\<c-e>\<c-u>".a:cmd.(a:run ? "\<cr>" : ""))
endf
command! -nargs=? -bang Trun call s:tmux_run(<bang>0, 1, <q-args>)

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-jdaddy'
Plug 'AndrewRadev/linediff.vim'
let g:linediff_buffer_type = 'scratch'
" Plug 'mbbill/undotree'
Plug 'kana/vim-niceblock'

" TODO: https://github.com/vheon/home/blob/master/.vim/plugin/text-object-entire.vim
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'gaving/vim-textobj-argument'

Plug 'tpope/vim-commentary'

Plug 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]

Plug 'ajh17/VimCompletesMe'

if s:plugins_fluff
  "TODO: dbext bugs:
  "   - dbext BufRead handler adds `gg` to jumplist. steps:
  "       :h h
  "       :h a
  "       <c-o>
  "   - does not honor g:dbext_default_usermaps
  Plug 'dbext.vim', { 'on': [ 'DBExecRangeSQL', 'DBExecVisualSQL'  ] }
  " dbext profile example:
  "   let g:dbext_default_profile = 'default'
  "   let g:dbext_default_profile_default = 'type=SQLSRV:integratedlogin=1:dbname=foo:host=localhost:srvname=localhost\sqlexpress:bin_path=C:\Program Files\Microsoft SQL Server\120\Tools\Binn'
  let g:dbext_default_history_file = expand('~/.dbext_sql_history', 1)
  let g:dbext_default_history_size = 1000
  let g:dbext_default_history_max_entry = 10*1024
  let g:dbext_default_usermaps = 0

  Plug 'majutsushi/tagbar'

  Plug 'guns/vim-sexp'
  Plug 'guns/vim-clojure-highlight'
  let g:clojure_fold = 1
  let g:sexp_filetypes = ''

  Plug 'tpope/vim-salve'
  let g:salve_auto_start_repl = 1
  Plug 'tpope/vim-fireplace'

  Plug 'chrisbra/vim-diff-enhanced'
  Plug 'zhaocai/DirDiff.vim'

  Plug 'PProvost/vim-ps1'
  Plug 'pangloss/vim-javascript'
  Plug 'leafo/moonscript-vim'
  Plug 'chrisbra/Colorizer', { 'on': ['ColorHighlight'] }
  " Plug 'chrisbra/Recover.vim'
  Plug 'osyo-manga/vim-over'

  Plug 'inside/vim-search-pulse'
  let g:vim_search_pulse_mode = 'pattern'
  let g:vim_search_pulse_disable_auto_mappings = 1
  let g:vim_search_pulse_color_list = ["red", "white"]
  let g:vim_search_pulse_duration = 200

  Plug 'ryanss/vim-hackernews', { 'on': ['HackerNews'] }
  Plug 'junegunn/vim-github-dashboard'
  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
  "Plug 'jaxbot/github-issues.vim'
  "Plug 'codegram/vim-codereview'
  Plug 'gcavallanti/vim-noscrollbar'

  Plug 'junegunn/vim-easy-align'
  vmap z; <Plug>(EasyAlign)
  nmap z; <Plug>(EasyAlign)

  Plug 'junegunn/vader.vim'

  if !s:is_windows && !s:is_msys
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes n \| ./install' }
    Plug 'junegunn/fzf.vim'
    let g:fzf_command_prefix = 'Fzf'
  endif

  if exists("$GOPATH")
    Plug 'Blackrush/vim-gocode'
  endif

  Plug 'tpope/vim-projectionist'
  " look at derekwyatt/vim-fswitch for more C combos.
  let g:projectionist_heuristics = {
        \  '*.sln': {
        \    '*.cs': {'alternate': ['{}.designer.cs']},
        \    '*.designer.cs': {'alternate': ['{}.cs']},
        \  },
        \  '/*.c|src/*.c': {
        \    '*.c': {'alternate': ['../include/{}.h', '{}.h']},
        \    '*.h': {'alternate': '{}.c'},
        \  },
        \  'Makefile': {
        \    '*Makefile': {'alternate': '{dirname}CMakeLists.txt'},
        \    '*CMakeLists.txt': {'alternate': '{dirname}Makefile'},
        \  },
        \}

  Plug 'embear/vim-localvimrc'
  let g:localvimrc_sandbox = 0
  let g:localvimrc_name = [".lvimrc", "contrib/localvimrc/lvimrc"]
  " let g:localvimrc_whitelist = escape(expand('~'), '\').'\.lvimrc'
  let g:localvimrc_persistent = 1

  Plug 'Valloric/MatchTagAlways', { 'for': 'xml' }
  Plug 'davidhalter/jedi-vim', { 'for': 'python' }
  " if s:is_windows && has('python') && !s:is_msysgit
  " Plug 'nosami/Omnisharp'
  " endif

  Plug 'thinca/vim-quickrun'
endif

call plug#end()

" Eager-load these plugins so we can override their settings. {{{
runtime! plugin/rsi.vim
" https://github.com/tpope/vim-sleuth/issues/29#issuecomment-109807606
runtime! plugin/sleuth.vim
" }}}

" sensible.vim {{{
if !has("nvim")
  set ttimeout
  set ttimeoutlen=100
  set backspace=eol,start,indent
  set wildmenu
  set display+=lastline
  set viminfo^=!
  set sessionoptions-=options

  if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j " Delete comment character when joining commented lines
  endif
  setglobal tags-=./tags tags-=./tags; tags^=./tags;

  set autoindent  " Note: 'smartindent' is superseded by 'cindent' and 'indentexpr'.
  set complete-=i
  set smarttab    " Use 'shiftwidth' when using <Tab> in front of a line. By default it's used only for shift commands ("<", ">").

  set incsearch
  set mouse=a     " Enable mouse usage (all modes)
  set hlsearch    " highlight search matches

  set autoread

  " Load matchit.vim, but only if the user hasn't installed a newer version.
  if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
  endif

  " Allow color schemes to do bright colors without forcing bold.
  if &t_Co == 8 && $TERM !~# '^linux'
    set t_Co=16
  endif

  set nrformats-=octal
  set laststatus=2
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use <C-L> to:
"   - redraw
"   - clear the highlighting of :set hlsearch
"   - update the current diff (if any)
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

set showcmd

set history=10000

inoremap <C-U> <C-G>u<C-U>
" }}}

function! s:ctrl_u() "{{{ rsi ctrl-u, ctrl-w
  if getcmdpos() > 1
    let @- = getcmdline()[:getcmdpos()-2]
  endif
  return "\<C-U>"
endfunction

function! s:ctrl_w_before()
  let s:cmdline = getcmdpos() > 1 ? getcmdline() : ""
  return "\<C-W>"
endfunction

function! s:ctrl_w_after()
  if strlen(s:cmdline) > 0
    let @- = s:cmdline[(getcmdpos()-1) : (getcmdpos()-2)+(strlen(s:cmdline)-strlen(getcmdline()))]
  endif
  return ""
endfunction

cnoremap <expr> <C-U> <SID>ctrl_u()
cnoremap <expr> <SID>(ctrl_w_before) <SID>ctrl_w_before()
cnoremap <expr> <SID>(ctrl_w_after) <SID>ctrl_w_after()
cmap   <script> <C-W> <SID>(ctrl_w_before)<SID>(ctrl_w_after)
cnoremap        <C-Y> <C-R>-

"}}}

endif "}}}
