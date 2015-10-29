lazy_source() {
  eval "$1 () { [[ -f $2 ]] && source $2 && $1 \$@; }"
}

# z jump around
if [[ -e "/usr/local/etc/profile.d/z.sh" ]]; then
  . "/usr/local/etc/profile.d/z.sh"
fi

# nvm, lasy load nvm, because it's slow
# https://github.com/creationix/nvm/issues/539
export NVM_DIR="$HOME/.nvm"
NVM_SOURCE=/usr/local/opt/nvm/nvm.sh
lazy_source nvm $NVM_SOURCE

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
if [[ -e /usr/local/opt/android-sdk ]]; then
  export ANDROID_HOME=/usr/local/opt/android-sdk
elif [[ -e "$HOME/Library/Android/sdk" ]]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
fi
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"

# ruby
# https://github.com/carsomyr/rbenv-bundler/issues/33
if [[ $HAS_RBENV -eq 1 ]]; then eval "$(rbenv init --no-rehash -)"; fi

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
