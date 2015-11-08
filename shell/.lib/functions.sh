if [[ ! $DOT_SHELL_LIB_FUNCTIONS -eq 1 ]]; then
DOT_SHELL_LIB_FUNCTIONS=1

dusort() {
  if [[ $IS_LINUX -eq 1 ]]; then
    du -h -d 1 $1 | sort -h
  elif [[ -x `which gsort` ]]; then
    du -h -d 1 $1 | gsort -h
  else
    echo "Please install coreutils to use sort."
    du -h -d 1 $1
  fi
}

# http://alias.sh/paginated-colored-tree
ltree() { tree -C $* | less -R; }

open_chrome() { open -a Google\ Chrome $1 }
open_google() { open_chrome "https://google.com/search?q=$1"; }
open_baidu()  { open_chrome "https://www.baidu.com/s?wd=$1";  }
alias goo=open_google
alias bai=open_baidu

tophistory() {
  history \
    | awk '{CMD[$2]++;count++;} END { for(a in CMD) {print CMD[a] " " CMD[a]/count*100 "% " a} }' \
    | grep -v "./" \
    | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

fi
