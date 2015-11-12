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

open_chrome() { open -a Google\ Chrome $1; }
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

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
      *.tar.gz) tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
      *.tar.xz) tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
      *.bz2) bunzip2 $1 && cd $(basename "$1" /bz2) ;;
      *.rar) unrar x $1 && cd $(basename "$1" .rar) ;;
      *.gz) gunzip $1 && cd $(basename "$1" .gz) ;;
      *.tar) tar xvf $1 && cd $(basename "$1" .tar) ;;
      *.tbz2) tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
      *.tgz) tar xvzf $1 && cd $(basename "$1" .tgz) ;;
      *.zip) unzip $1 && cd $(basename "$1" .zip) ;;
      *.Z) uncompress $1 && cd $(basename "$1" .Z) ;;
      *.7z) 7z x $1 && cd $(basename "$1" .7z) ;;
      *) echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

gitzip() {
  git archive -o $(basename $PWD).zip HEAD
}

gittgz() {
  git archive -o $(basename $PWD).tgz HEAD
}

fi
