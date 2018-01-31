if [[ ! $DOT_SHELL_LIB_PATH_LINUX -eq 1 ]]; then
DOT_SHELL_LIB_PATH_LINUX=1

# golang
if [[ -e "/usr/local/go" ]]; then
  # https://www.digitalocean.com/community/tutorials/how-to-install-go-1-6-on-ubuntu-14-04
  export GOROOT="/usr/local/go"
elif [[ -e "/usr/lib/golang" ]]; then
  # centos
  export GOROOT="/usr/lib/golang"
fi

if [[ -e "$HOME/.lib/path.linux.local" ]]; then . "$HOME/.lib/path.linux.local"; fi

fi
