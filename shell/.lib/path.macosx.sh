if [[ ! $DOT_SHELL_LIB_PATH_MACOSX -eq 1 ]]; then
DOT_SHELL_LIB_PATH_MACOSX=1

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
export GOROOT=/usr/local/opt/go/libexec

# heroku
export HEROKU_HOME=/usr/local/heroku

# java
export JAVA_HOME="$(/usr/libexec/java_home)"

# android sdk
if [[ -e /usr/local/opt/android-sdk ]]; then
  export ANDROID_HOME=/usr/local/opt/android-sdk
elif [[ -e "$HOME/Library/Android/sdk" ]]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
fi

# haskell
export HASKELL_HOME="$HOME/Library/Haskell"

if [[ -e "$HOME/.lib/path.macosx.local" ]]; then . "$HOME/.lib/path.macosx.local"; fi

fi
