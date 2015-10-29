# DIR="$(cd "$(dirname "$0")" && pwd)"
# DIR="$(dirname "$(readlink -f "$0")")"
# echo $(pwd -P)

source $HOME/.lib/checks.sh
source $HOME/.lib/alias.sh
source $HOME/.lib/path.sh

export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export EDITOR=vi

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
