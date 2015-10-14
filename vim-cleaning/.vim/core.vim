let s:is_mac = has('mac')
let s:is_cygwin = has('win32unix') || has('win64unix') "treat this as mintty
let s:is_windows = has('win32') || has('win64')
let s:is_msysgit = (has('win32') || has('win64')) && $TERM ==? 'cygwin'
let s:is_msys = ($MSYSTEM =~? 'MINGW\d\d')
let s:plugins = filereadable(expand("~/.vim/autoload/plug.vim", 1))
let s:plugins_fluff = !s:is_msys && s:plugins
