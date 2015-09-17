if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

source ~/.git-completion.bash

#for nvm
source $(brew --prefix nvm)/nvm.sh
export NVM_DIR=~/.nvm

alias ll='ls -alh'

# http://alias.sh/paginated-colored-tree
ltree()
{
    tree -C $* | less -R
}

# grep color
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'
#enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
