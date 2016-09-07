if [[ ! $DOT_SHELL_LIB_FUNCTIONS -eq 1 ]]; then
DOT_SHELL_LIB_FUNCTIONS=1

du_sort() {
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

du_largest() {
  du -kx | egrep -v "\./.+/" | sort -n
}

# history {{{

history_top() {
  fc -l 1 \
    | awk '{CMD[$2]++;count++;} END { for(a in CMD) {print CMD[a] " " CMD[a]/count*100 "% " a} }' \
    | grep -v "./" \
    | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

history_ssh() {
  # history | ag '^\s*\d+\*?\s+ssh\s'
  fc -l 1 \
    | ag '^\s*\d+\*?\s+ssh\s' \
    | ruby -e 'puts STDIN.readlines.map { |l| l.sub(/^[\d\*\s]*/, "").strip }.uniq'
    # | python -c 'import os, sys, re; sshs = map(lambda l: re.sub("^[\d\*\s]*", "", l).strip(), sys.stdin.readlines()); print "\n".join(list(set(sshs)))'
}

# }}}

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

# back to git project root directory
cdr() {
  cd $(git rev-parse --show-toplevel)
}
cdrr() {
  local gitinfo

  cdr

  cd ..
  gitinfo=$(git status 2>&1)
  if [[ $gitinfo == *"fatal: Not a git repository"* ]]; then
    cd -
  else
    cdr
  fi
}

search_hosts() {
  # cat /etc/hosts | grep $1 | awk '{print $1, $2}'
  cat /etc/hosts | grep $1 | ruby -ne 'puts STDIN.read.gsub(/^#.*\n/, "")'
}

search_docker_image_tags() {
  curl -sSL "https://registry.hub.docker.com//v1/repositories/$@/tags" | jq '.[] | .name' | sort -r
}

docker_ip() {
  local green
  local nc # no color

  green='\033[0;32m'
  nc='\033[0m'
  echo "${green}docker format:${nc}"
  docker inspect -f '{{.Name}} - {{.NetworkSettings.IPAddress }}' $(docker ps -q)
  echo "${green}docker-compose format:${nc}"
  docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -q)
}

docker_delete_container() {
  local container_regexp
  container_regexp=$1

  if [[ -z $container_regexp ]]; then
    echo 'Need container name regexp.'
  else
    docker ps -a | grep $1 | awk '{print $(NF)}' | ruby -pe 'puts `docker rm #{$_}`'
  fi
}

fi
