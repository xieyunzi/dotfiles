if [[ ! $DOT_SHELL_PROFILE -eq 1 ]]; then
DOT_SHELL_PROFILE=1

# DIR="$(cd "$(dirname "$0")" && pwd)"
# DIR="$(dirname "$(readlink -f "$0")")"
# echo $(pwd -P)

export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export EDITOR=vi
export LANG=en_US.UTF-8

source $HOME/.lib/checks.sh
source $HOME/.lib/path.sh
source $HOME/.lib/alias.sh
source $HOME/.lib/functions.sh

# history
# http://stackoverflow.com/questions/19454837/bash-histsize-vs-histfilesize
# http://zsh.sourceforge.net/Guide/zshguide02.html
export HISTFILESIZE=100000
export HISTSIZE=${HISTFILESIZE}
export SAVEHIST=${HISTFILESIZE}

# dotfiles custom bin file
export PATH="$HOME/.bin:$PATH"
# load custom profile
if [[ -e "$HOME/.profile.local" ]]; then . "$HOME/.profile.local"; fi

fi
