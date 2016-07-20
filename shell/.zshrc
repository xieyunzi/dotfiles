if [[ ! $DOT_SHELL_ZSHRC -eq 1 ]]; then
DOT_SHELL_ZSHRC=1

export SHELL=/bin/zsh
alias loadrc="source $HOME/.zshrc"

# oh-my-zsh
source $HOME/.zshrc.pre-oh-my-zsh

# add by xyz ---------------------------------------------

# for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# history, sessions don't share the command history with each other
# although when you start new session
# it gets all the previous history from all sessions before it
# http://superuser.com/questions/410965/command-history-in-zsh
setopt INC_APPEND_HISTORY

# for hh https://github.com/dvorka/hstr
export HISTFILE=~/.zsh_history  # ensure history file visibility

# git completion
if [ -f /usr/local/share/zsh/site-functions ]; then
  . /usr/local/share/zsh/site-functions
fi

[[ -s "$HOME/.lib/lead" ]] && source "$HOME/.lib/lead"

fi
