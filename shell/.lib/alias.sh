if [[ ! $DOT_SHELL_LIB_ALIAS -eq 1 ]]; then
DOT_SHELL_LIB_ALIAS=1

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

### Colored ls
if [[ -x /usr/bin/dircolors ]]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
  alias l='ls -lha --color=auto'
  alias ll='ls -lh --color=auto'

  alias grep='grep --color=auto'
elif [[ $IS_MAC -eq 1 ]]; then
  alias ls='ls -G'
  alias l='ls -G -lha'
  alias ll='ls -G -lh'
fi

alias ls.='ls -d .*'
alias l.='l -d .*'
alias ll.='ll -d .*'

if [[ -x $(which hub) ]]; then alias g=hub; else alias g=git; fi
alias tm=tmux

alias dr=docker
alias drc=docker-compose
alias drm=docker-machine

# for vim {{{

# use neovim
if [[ $HAS_NVIM -eq 1 ]]; then
  alias v=nvim
else
  alias v=vim
fi
alias vi2="v -O2 "
# }}}

alias rl_sqlite3="rlwrap -a -A sqlite3"
alias rl_iex="rlwrap -a -A iex"
alias rl_erl="rlwrap -a -A erl"

# for curl {{{

# get web server headers
alias header='curl -I'
# find out if remote server supports gzip / mod_deflate or not
alias headerc='curl -I --compress'

if [[ $IS_LINUX -eq 1 ]]; then
  alias ports='netstat -tulanp'
else
  alias ports='netstat -tulan'
fi

# wget alias
# http://www.mymacosx.com/terminal/wget-replacement-macos.html
# http://superuser.com/questions/142459/persistent-retrying-resuming-downloads-with-curl
if [[ ! -x `which wget` ]]; then
  alias wget="curl -O --retry 999 --retry-max-time 0 -C -"
fi

# }}}

if [[ $IS_LINUX -eq 1 ]]; then
  # iptables alias for linux
  # usage: iptlist -t nat
  alias iptlist="sudo /sbin/iptables -L -n -v --line-numbers"
  alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
  alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
  alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'

  # Get system memory, cpu usage quickly {{{
  ## pass options to free
  alias meminfo='free -m -l -t'

  ## get top process eating memory
  alias psmem='ps auxf | sort -nr -k 4'
  alias psmem10='ps auxf | sort -nr -k 4 | head -10'

  ## get top process eating cpu
  alias pscpu='ps auxf | sort -nr -k 3'
  alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

  ## Get server cpu info
  alias cpuinfo='lscpu'
  # }}}
fi

# for ruby
alias be='bundle exec'

fi
