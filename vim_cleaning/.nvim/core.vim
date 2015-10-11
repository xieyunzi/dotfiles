" windows builds: http://files.kaoriya.net/vim/
"                 64-bit: http://solar-blogg.blogspot.ca/p/vim-build.html
" neovim:
"   msys:
"       http://sourceforge.net/projects/msys2/files/Alpha-versions/
"       Synchronize package databases
"         $ pacman -Sy
"       Install packages/groups:
"         $ pacman -S openssh
"         $ pacman -S base-devel
"         $ pacman -S msys2-devel
"   mingw:
"       http://mingw-w64.sourceforge.net/download.php#mingw-builds
"       http://nuwen.net/mingw.html
"   julia build moving to msys2:
"       https://github.com/JuliaLang/julia/issues/3640
"   julia msys2 build instructions:
"       https://github.com/JuliaLang/julia/pull/5982
"
" If this .vimrc is not in $HOME, add these lines to $HOME/.vimrc :
"    set runtimepath+=/path/to/.vim
"    source /path/to/.vimrc
"==============================================================================

" Tell vimball to get lost.
let g:loaded_vimballPlugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_rrhelper = 1

let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

let s:is_mac = has('mac')
let s:is_cygwin = has('win32unix') || has('win64unix') "treat this as mintty
let s:is_windows = has('win32') || has('win64')
let s:is_msysgit = (has('win32') || has('win64')) && $TERM ==? 'cygwin'
let s:is_msys = ($MSYSTEM =~? 'MINGW\d\d')
let s:plugins = filereadable(expand("~/.vim/autoload/plug.vim", 1))
let s:plugins_fluff = !s:is_msys && s:plugins
