if [[ ! $DOT_SHELL_LIB_TMUX -eq 1 ]]; then
DOT_SHELL_LIB_TMUX=1

function ts {
  local args=$@
  tmux send-keys -t right "$args" C-m
}

fi
