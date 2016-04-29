if [[ ! $DOT_SHELL_LIB_ALIAS -eq 1 ]]; then
DOT_SHELL_LIB_ALIAS=1

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias l="ls -lhTF"
alias ll="ls -alhT"

### Colored ls
if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
elif [ $IS_MAC -eq 1 ]; then
  alias ls='ls -G'
fi

alias g=git
alias tm=tmux

# vim {{{

# use neovim
if [[ $HAS_NVIM -eq 1 ]]; then
  alias v=nvim
else
  alias v=vim
fi
alias vi2="v -O2 "
# }}}

alias sqlite3_rl="rlwrap sqlite3"

# wget alias
# http://www.mymacosx.com/terminal/wget-replacement-macos.html
# http://superuser.com/questions/142459/persistent-retrying-resuming-downloads-with-curl
alias wget="curl -O --retry 999 --retry-max-time 0 -C -"

if [[ $IS_MAC -eq 1 ]]; then
  alias psqlstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
  alias psqlstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
  # alias psqlstop='pg_ctl stop'
fi

#alias for cnpm
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

fi
