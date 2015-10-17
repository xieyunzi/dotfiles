" {{{
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" {{{
call vundle#begin('~/.vim/bundle')

" Let Vundle manage itself.
Plugin 'https://github.com/VundleVim/Vundle.vim.git'

" Color
Plugin 'https://github.com/altercation/vim-colors-solarized.git'

" Langs
Plugin 'https://github.com/ngmy/vim-rubocop.git'
Plugin 'https://github.com/leafgarland/typescript-vim.git'
Plugin 'https://github.com/vim-scripts/cmake.vim.git'
Plugin 'https://github.com/digitaltoad/vim-jade.git'
Plugin 'https://github.com/mxw/vim-jsx.git'
Plugin 'https://github.com/gkz/vim-ls.git'
Plugin 'https://github.com/rust-lang/rust.vim.git'
Plugin 'https://github.com/tpope/vim-haml.git'
Plugin 'https://github.com/pangloss/vim-javascript.git'
Plugin 'https://github.com/jelera/vim-javascript-syntax.git'
Plugin 'https://github.com/tpope/vim-cucumber.git'
Plugin 'https://github.com/tpope/vim-markdown.git'
Plugin 'https://github.com/mustache/vim-mustache-handlebars.git'
Plugin 'https://github.com/ajf/puppet-vim.git'
Plugin 'https://github.com/rosstimson/scala-vim-support.git'
Plugin 'https://github.com/kchmck/vim-coffee-script.git'
Plugin 'https://github.com/tpope/vim-git.git'
Plugin 'https://github.com/timcharper/textile.vim.git'
Plugin 'https://github.com/skwp/vim-rspec.git'
Plugin 'https://github.com/cakebaker/scss-syntax.vim.git'
Plugin 'https://github.com/chrisbra/csv.vim.git'
Plugin 'https://github.com/mmalecki/vim-node.js.git'
Plugin 'https://github.com/vim-ruby/vim-ruby.git'
Plugin 'https://github.com/vim-scripts/Arduino-syntax-file.git'
Plugin 'https://github.com/groenewege/vim-less.git'
Plugin 'https://github.com/wlangstroth/vim-haskell.git'
Plugin 'https://github.com/slim-template/vim-slim.git'
Plugin 'https://github.com/jimenezrick/vimerl.git'
Plugin 'https://github.com/sunaku/vim-ruby-minitest.git'
Plugin 'https://github.com/guns/vim-clojure-static.git'
Plugin 'guns/vim-clojure-highlight'
let g:clojure_fold = 1
let g:sexp_filetypes = ''
Plugin 'https://github.com/elixir-lang/vim-elixir.git'
Plugin 'https://github.com/tpope/vim-liquid.git'
Plugin 'https://github.com/depuracao/vim-rdoc.git'
Plugin 'https://github.com/fatih/vim-go.git'
" for lisp
Plugin 'https://github.com/kovisoft/slimv.git'
Plugin 'https://github.com/moll/vim-node.git'
Plugin 'https://github.com/tpope/vim-rails.git'

" Tools
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/edsono/vim-matchit.git'
Plugin 'https://github.com/ervandew/supertab.git'
Plugin 'https://github.com/mileszs/ack.vim.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/sjl/gundo.vim.git'
Plugin 'https://github.com/tpope/vim-surround.git'
let g:surround_indent = 1
let g:surround_no_insert_mappings = 1

Plugin 'https://github.com/garbas/vim-snipmate.git'
Plugin 'https://github.com/tomtom/tlib_vim.git'
Plugin 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/michaeljsmith/vim-indent-object.git'
Plugin 'https://github.com/tpope/vim-endwise.git'
Plugin 'https://github.com/mattn/webapi-vim.git'
Plugin 'https://github.com/mattn/gist-vim.git'
Plugin 'https://github.com/vim-scripts/vimwiki.git'
Plugin 'https://github.com/ap/vim-css-color.git'
Plugin 'https://github.com/Lokaltog/vim-easymotion.git'
Plugin 'https://github.com/chrisbra/NrrwRgn.git'
Plugin 'https://github.com/jeetsukumaran/vim-buffergator.git'
Plugin 'https://github.com/rgarver/Kwbd.vim.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/skalnik/vim-vroom.git'
Plugin 'https://github.com/tpope/vim-eunuch.git'
Plugin 'https://github.com/tpope/vim-repeat.git'
Plugin 'https://github.com/honza/vim-snippets.git'
Plugin 'https://github.com/tpope/vim-dispatch.git'
nnoremap !m :<c-u>Make<cr>
nnoremap !] :<c-u>Start! ctags -R *<cr>
" ways to run external commands in vim: https://gist.github.com/sjl/b9e3d9f821e57c9f96b3
nnoremap !t :<c-u>Trun TEST_FILE=<c-r>% make functionaltest<cr>
nnoremap !T :<c-u>Make unittest<cr>

Plugin 'https://github.com/terryma/vim-multiple-cursors.git'
Plugin 'https://github.com/thinca/vim-visualstar.git'
Plugin 'https://github.com/bronson/vim-trailing-whitespace.git'
Plugin 'https://github.com/elzr/vim-json.git'
Plugin 'https://github.com/airblade/vim-gitgutter.git'
" Plugin 'https://github.com/Yggdroot/indentLine.git'
" Plugin 'tpope/vim-sleuth'
Plugin 'https://github.com/mattn/emmet-vim.git'
Plugin 'https://github.com/Chiel92/vim-autoformat.git'
" Plugin 'https://github.com/junegunn/vim-easy-align.git'
Plugin 'https://github.com/kshenoy/vim-signature.git'
Plugin 'https://github.com/rhlobo/vim-super-retab.git'
Plugin 'https://github.com/troydm/zoomwintab.vim.git'
Plugin 'https://github.com/vim-scripts/Align.git'
" Plugin 'https://github.com/editorconfig/editorconfig-vim.git'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/justinmk/vim-gtfo.git'
Plugin 'https://github.com/szw/vim-tags.git'
Plugin 'https://github.com/vim-scripts/copypath.vim.git'
Plugin 'https://github.com/svermeulen/vim-easyclip.git'
Plugin 'https://github.com/tpope/vim-speeddating.git'
Plugin 'https://github.com/tpope/vim-abolish.git'
Plugin 'https://github.com/tpope/vim-commentary.git'
Plugin 'https://github.com/xolox/vim-misc.git'
Plugin 'https://github.com/xieyunzi/apidock.vim.git'
Plugin 'tomasr/molokai'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tommcdo/vim-exchange'
Plugin 'kopischke/vim-fetch'
Plugin 'https://github.com/justinmk/vim-ipmotion.git'
Plugin 'https://github.com/justinmk/vim-dirvish.git'
Plugin 'https://github.com/justinmk/vim-sneak.git'
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

Plugin 'https://github.com/justinmk/vim-syntax-extra.git'
Plugin 'https://github.com/justinmk/vim-matchparenalways.git'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-jdaddy'
Plugin 'AndrewRadev/linediff.vim'
let g:linediff_buffer_type = 'scratch'
" Plugin 'mbbill/undotree'
Plugin 'kana/vim-niceblock'

" TODO: https://github.com/vheon/home/blob/master/.vim/plugin/text-object-entire.vim
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'gaving/vim-textobj-argument'

Plugin 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]

Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-salve'
let g:salve_auto_start_repl = 1
Plugin 'tpope/vim-fireplace'

Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'zhaocai/DirDiff.vim'

Plugin 'PProvost/vim-ps1'
Plugin 'chrisbra/Colorizer'
" Plugin 'chrisbra/Recover.vim'
Plugin 'osyo-manga/vim-over'

Plugin 'inside/vim-search-pulse'
let g:vim_search_pulse_mode = 'pattern'
let g:vim_search_pulse_disable_auto_mappings = 1
let g:vim_search_pulse_color_list = ["red", "white"]
let g:vim_search_pulse_duration = 200

Plugin 'ryanss/vim-hackernews'
Plugin 'junegunn/vim-github-dashboard'
"Plugin 'jaxbot/github-issues.vim'
"Plugin 'codegram/vim-codereview'
Plugin 'gcavallanti/vim-noscrollbar'

Plugin 'junegunn/vader.vim'

if exists("$GOPATH")
  Plugin 'Blackrush/vim-gocode'
endif

" Plugin 'tpope/vim-projectionist'
" look at derekwyatt/vim-fswitch for more C combos.

" Plugin 'embear/vim-localvimrc'
" let g:localvimrc_sandbox = 0
" let g:localvimrc_name = [".lvimrc", "contrib/localvimrc/lvimrc"]
" let g:localvimrc_whitelist = escape(expand('~'), '\').'\.lvimrc'
" let g:localvimrc_persistent = 1

" Plugin 'Valloric/MatchTagAlways'
" Plugin 'davidhalter/jedi-vim'
" if s:is_windows && has('python') && !s:is_msysgit
" Plugin 'nosami/Omnisharp'
" endif

" Plugin 'thinca/vim-quickrun'

" sensible.vim {{{
Plugin 'https://github.com/tpope/vim-sensible.git'
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

call vundle#end()
" }}}

" Eager-load these plugins so we can override their settings. {{{
" https://github.com/tpope/vim-sleuth/issues/29#issuecomment-109807606
runtime! plugin/sleuth.vim
" }}}

filetype plugin indent on
" }}}
