if [[ ! $DOT_SHELL_BASHRC -eq 1 ]]; then
DOT_SHELL_BASHRC=1

export SHELL=/bin/bash
alias loadrc="source $HOME/.bashrc"

# for fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f /usr/local/etc/bash_completion.d ]; then
  . /usr/local/etc/bash_completion.d
fi

export HISTFILE=~/.bash_history  # ensure history file visibility
# add this configuration to ~/.bashrc
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=100000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync

[[ -s "$HOME/.lib/lead" ]] && source "$HOME/.lib/lead"

fi
