if [ -f ~/.profile ]; then . ~/.profile; fi

# for hstr
export HISTFILE=~/.zsh_history
export HH_CONFIG=hicolor         # get more colors
bindkey -s "\C-r" "\eqhh\n"
