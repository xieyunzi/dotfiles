export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

alias ll='ls -alh'
export EDITOR="vi"

# android sdk
# export ANDROID_HOME=${HOME}/Applications/android-sdk-macosx
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"

# nodejs nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# golang path
export GOPATH=~/.xzgolang
export PATH=$PATH:$GOPATH/bin
