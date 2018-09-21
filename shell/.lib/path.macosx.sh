if [[ ! $DOT_SHELL_LIB_PATH_MACOSX -eq 1 ]]; then
DOT_SHELL_LIB_PATH_MACOSX=1

# curl
if [[ -d /usr/local/opt/curl/bin ]]; then
  export PATH="/usr/local/opt/curl/bin:$PATH"
fi
# sqlite
if [[ -d /usr/local/opt/sqlite/bin ]]; then
  export PATH="/usr/local/opt/sqlite/bin:$PATH"
fi

# nvm, lasy load nvm, because it's slow
# https://github.com/creationix/nvm/issues/539
# export NVM_DIR="$HOME/.nvm"
# NVM_SOURCE=/usr/local/opt/nvm/nvm.sh
# lazy_source nvm $NVM_SOURCE

# golang
if [[ -d /usr/local/opt/go/libexec ]]; then
  export GOROOT=/usr/local/opt/go/libexec
fi

# python
if [[ -d /usr/local/opt/python3/bin ]]; then
  export PATH="/usr/local/opt/python3/bin:$PATH"
fi
if [[ -d /usr/local/opt/python2/bin ]]; then
  export PATH="/usr/local/opt/python2/bin:$PATH"
fi

# heroku
# export HEROKU_HOME=/usr/local/heroku

# java
# use sdkman install java
# export JAVA_HOME="$(/usr/libexec/java_home)"

# android sdk
if [[ -e /usr/local/opt/android-sdk ]]; then
  export ANDROID_HOME=/usr/local/opt/android-sdk
elif [[ -e "$HOME/Library/Android/sdk" ]]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
fi

# postgres libpq
if [[ -d /usr/local/opt/libpq/bin ]]; then
  export PATH="/usr/local/opt/libpq/bin:$PATH"
fi

# openssl
if [[ -e /usr/local/opt/openssl ]]; then
  export PATH="/usr/local/opt/openssl/bin:$PATH"
fi
# libressl
if [[ -e /usr/local/opt/libressl ]]; then
  export PATH="/usr/local/opt/libressl/bin:$PATH"
fi
# make
if [[ -e /usr/local/opt/make/libexec/gnubin ]]; then
  export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
fi


if [[ -e "$HOME/.lib/path.macosx.local" ]]; then . "$HOME/.lib/path.macosx.local"; fi

fi
