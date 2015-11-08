if [[ ! $DOT_SHELL_LIB_CHECKS -eq 1 ]]; then
DOT_SHELL_LIB_CHECKS=1

# checks (stolen from zshuery)
if [[ $(uname) = 'Linux' ]]; then IS_LINUX=1; fi
if [[ $(uname) = 'Darwin' ]]; then IS_MAC=1; fi
if [[ -x `which brew` ]]; then HAS_BREW=1; fi
if [[ -x `which apt-get` ]]; then HAS_APT=1; fi
if [[ -x `which yum` ]]; then HAS_YUM=1; fi
if [[ -x `which nvim` ]]; then HAS_NVIM=1; fi
if [[ -x `which rbenv` ]]; then HAS_RBENV=1; fi

fi
