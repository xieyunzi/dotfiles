if [[ ! $DOT_SHELL_LIB_PATH -eq 1 ]]; then
DOT_SHELL_LIB_PATH=1

lazy_source() {
  eval "$1 () { [[ -f $2 ]] && source $2 && $1 \$@; }"
}

# ruby
# https://github.com/carsomyr/rbenv-bundler/issues/33
if [[ $HAS_RBENV -eq 1 ]]; then eval "$(rbenv init --no-rehash -)"; fi

# http://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash

# golang
# var: GOROOT
if [[ -z ${GOROOT+x} ]]; then
  export GOPATH=$HOME/.go
  export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
fi

# heroku
# var: HEROKU_HOME
if [[ -z ${HEROKU_HOME+x} ]]; then export PATH="$HEROKU_HOME/bin:$PATH"; fi

# java
# var: JAVA_HOME
if [[ -z ${JAVA_HOME+x} ]]; then
  export JAVA_BIN="$JAVA_HOME/bin"
  export CLASSPATH=".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar"
  export PATH="$JAVA_HOME/bin:$PATH"
fi

# android
# var: ANDROID_HOME
if [[ -z ${ANDROID_HOME+x} ]]; then
  export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
fi

# haskell
# HASKELL_HOME
if [[ -z ${HASKELL_HOME+x} ]]; then export PATH="$HASKELL_HOME/bin:$PATH"; fi

if [[ $IS_MAC -eq 1 ]]; then
  # for mac
  source $HOME/.lib/path.macosx.sh
elif [[ $IS_LINUX -eq 1 ]]; then
  # for linux
  source $HOME/.lib/path.linux.sh
fi

# common
export PATH="$PATH:/usr/local/bin:/usr/local/sbin"

fi
