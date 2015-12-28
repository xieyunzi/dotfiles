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

# https://github.com/xvoland/Extract.git
extract() {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f "$1" ] ; then
        NAME=${1%.*}
        #mkdir $NAME && cd $NAME
        case "$1" in
          *.tar.bz2)   tar xvjf ./"$1"    ;;
          *.tar.gz)    tar xvzf ./"$1"    ;;
          *.tar.xz)    tar xvJf ./"$1"    ;;
          *.lzma)      unlzma ./"$1"      ;;
          *.bz2)       bunzip2 ./"$1"     ;;
          *.rar)       unrar x -ad ./"$1" ;;
          *.gz)        gunzip ./"$1"      ;;
          *.tar)       tar xvf ./"$1"     ;;
          *.tbz2)      tar xvjf ./"$1"    ;;
          *.tgz)       tar xvzf ./"$1"    ;;
          *.zip)       unzip ./"$1"       ;;
          *.Z)         uncompress ./"$1"  ;;
          *.7z)        7z x ./"$1"        ;;
          *.xz)        unxz ./"$1"        ;;
          *.exe)       cabextract ./"$1"  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "'$1' - file does not exist"
    fi
fi
}

gitzip() {
  git archive -o $(basename $PWD).zip HEAD
}

gittgz() {
  git archive -o $(basename $PWD).tgz HEAD
}

fi
