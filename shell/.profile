# DIR="$(cd "$(dirname "$0")" && pwd)"
# DIR="$(dirname "$(readlink -f "$0")")"
# echo $(pwd -P)

export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# history
# http://stackoverflow.com/questions/19454837/bash-histsize-vs-histfilesize
# http://zsh.sourceforge.net/Guide/zshguide02.html
export HISTFILESIZE=100000
export HISTSIZE=${HISTFILESIZE}
export SAVEHIST=${HISTFILESIZE}

# brew prefix path
export BREW_PREFIX_PATH=$(brew --prefix)

if [ -f "$BREW_PREFIX_PATH/etc/profile.d/z.sh" ]; then
  . "$BREW_PREFIX_PATH/etc/profile.d/z.sh"
fi

alias l="ls -lhT"
alias ll="ls -alhT"
alias g=git

# http://alias.sh/paginated-colored-tree
ltree()
{
  tree -C $* | less -R
}

open_google(){
  open -a Google\ Chrome "https://google.com/search?q=$1"
  # open -a Firefox "https://google.com/search?q=$1"
}
alias ggl=open_google

#alias for cnpm
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

# nvm
export BREW_PREFIX_NVM=$(brew --prefix nvm)
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/dist
export NVM_DIR="$HOME/.nvm"
[ -s "$BREW_PREFIX_NVM/nvm.sh" ] && . "$BREW_PREFIX_NVM/nvm.sh"

# golang
export GOROOT=$(go env GOROOT)
export GOPATH=$HOME/.go
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

# heroku
export PATH="/usr/local/heroku/bin:$PATH"

# java
export JAVA_HOME="$(/usr/libexec/java_home)"
export JAVA_BIN="$JAVA_HOME/bin"
export PATH="$PATH:$JAVA_HOME/bin"
export CLASSPATH=".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar"

# android sdk
# export ANDROID_HOME=${HOME}/Applications/android-sdk-macosx
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"

# ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# use neovim
# should `stow vim` to set `~/.nvimrc`
if which nvim > /dev/null; then alias vi=nvim; fi

# dotfiles custom bin file
export PATH="$HOME/.bin:$PATH"

# load custom profile
if [ -f "$HOME/.profile_custom" ]; then . "$HOME/.profile_custom"; fi
