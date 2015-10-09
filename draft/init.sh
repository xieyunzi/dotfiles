#!/bin/bash

((XZDEBUG)) || export XZDEBUG=1

install_apps() {
  if echo "$(uname -a)" | grep '.*Ubuntu.*' >/dev/null; then
    echo ubuntu

    ((XZDEBUG)) ||  apt-get install stow
  elif echo "$(uname -a)" | grep '.*Darwin.*' >/dev/null; then
    echo osx

    ((XZDEBUG)) || brew install stow
  else
    echo unknown system
  fi
}

install_app() {
  if [ type stow >/dev/null 2>&1 ]; then
    echo install stow

    install_stow
  else
    echo stow installed
  fi
}

init() {
  init_stow

  stow git vim

  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

install_stow
init_stow
((XZDEBUG)) || init
