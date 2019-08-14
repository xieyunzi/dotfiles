if [[ ! $DOT_SHELL_LIB_FZF -eq 1 ]]; then
DOT_SHELL_LIB_FZF=1

# https://github.com/junegunn/fzf
# https://github.com/junegunn/dotfiles/blob/master/bashrc

export FZF_DEFAULT_COMMAND="rg --hidden -g '!.git/' --files --no-ignore-messages"
export FZF_DEFAULT_OPTS="--reverse --inline-info"
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export FZF_TMUX_HEIGHT=20

frg(){
  local line
  line=`rg --line-number --hidden -g '!.git/' "$1" | fzf`
  [ -n "$line" ] && $EDITOR $(cut -d':' -f1 <<< "$line") +$(cut -d':' -f2 <<< "$line")
}
alias fag=frg

mf(){
  local line
  line=`mdfind -name "$1" | fzf`
  echo $line
}

mfo(){
  open -a "$(mf \"$1\")"
}

ff() {
  local file
  file=`rg --files --no-ignore-messages | fzf`
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# ffd - cd to selected directory
ffd() {
  DIR=`fd -t d | fzf-tmux` && cd "$DIR"
}

# ffda - including hidden directories
ffda() {
  DIR=`fd -t d -H | fzf-tmux` && cd "$DIR"
}

# git {{{

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" |
  fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
  git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
  git branch --all | grep -v HEAD             |
  sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
  sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
  (echo "$tags"; echo "$branches") |
  fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
    --bind "ctrl-m:execute:
  echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
  xargs -I % sh -c 'git show --color=always % | less -R'"
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
    while out=$(
      git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
      fzf --ansi --no-sort --query="$q" --print-query \
          --expect=ctrl-d,ctrl-b);
    do
      q=$(head -1 <<< "$out")
      k=$(head -2 <<< "$out" | tail -1)
      sha=$(tail -1 <<< "$out" | cut -d' ' -f1)
      [ -z "$sha" ] && continue
      if [ "$k" = 'ctrl-d' ]; then
        git diff $sha
      elif [ "$k" = 'ctrl-b' ]; then
        git stash branch "stash-$sha" $sha
        break;
      else
        git stash show -p $sha
      fi
    done
}

# }}}

# ftags - search ctags
ftags() {
  local line
  [ -e tags ] &&
    line=$(
  awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
  cut -c1-80 | fzf --nth=1,2
  ) && $EDITOR $(cut -f3 <<< "$line") -c "set nocst" \
    -c "silent tag $(cut -f2 <<< "$line")"
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf-tmux --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  out=$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

if [ -n "$TMUX_PANE" ]; then
  # ftpane - switch pane (@george-b)
  ftpane() {
    local panes current_window current_pane target target_window target_pane
    panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
    current_pane=$(tmux display-message -p '#I:#P')
    current_window=$(tmux display-message -p '#I')

    target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

    target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
    target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

    if [[ $current_window -eq $target_window ]]; then
      tmux select-pane -t ${target_window}.${target_pane}
    else
      tmux select-pane -t ${target_window}.${target_pane} &&
        tmux select-window -t $target_window
    fi
  }
fi

# tmux {{{

_tmux_session() {
  tmux list-sessions | fzf-tmux --query="$1" --select-1 --exit-0 | cut -d':' -f 1
}

# Switch tmux-sessions
fs() {
  local session
  session=$(_tmux_session $1)

  if [[ -z "$TMUX" ]]; then
    tmux attach -t "$session"
  else
    tmux switch-client -t "$session"
  fi
}

# attach tmux-sessions and detach others
# http://stackoverflow.com/questions/22138211/how-do-i-disconnect-all-other-users-in-tmux
fs-detach-others() {
  local session
  session=$(_tmux_session $1)

  # d=detach other clinents (so only you can attach to this session)
  if [[ -z "$TMUX" ]]; then
    tmux attach -dt "$session"
  else
    tmux switch-client -dt "$session"
  fi
}

fskill() {
  local session
  session=$(_tmux_session $1) && tmux kill-session -t "$session"
}

# ftpane - switch pane (@george-b)
ftpane() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

  if [[ $current_window -eq $target_window ]]; then
    tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
    tmux select-window -t $target_window
  fi
}

# }}}

# In tmux.conf
# bind-key 0 run "tmux split-window -l 12 'bash -ci ftpane'"

# c - browse chrome history
c_history() {
  local cols sep
  export cols=$(( COLUMNS / 3 ))
  export sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select title, url from urls order by last_visit_time desc" |
  ruby -ne '
  cols = ENV["cols"].to_i
  title, url = $_.split(ENV["sep"])
  len = 0
  puts "\x1b[36m" + title.each_char.take_while { |e|
  if len < cols
    len += e =~ /\p{Han}|\p{Katakana}|\p{Hiragana}|\p{Hangul}/ ? 2 : 1
    end
  }.join + " " * (2 + cols - len) + "\x1b[m" + url' |
  fzf --ansi --multi --no-hscroll --tiebreak=index |
  sed 's#.*\(https*://\)#\1#' | xargs open
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fssh - ssh history
fssh(){
  print -z $(history_ssh | fzf)
}

# fkill - kill process
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

unalias z 2>/dev/null

z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}

alias j=z
alias jj=zz

# http://junegunn.kr/2016/07/fzf-git/
# Will return non-zero status if the current directory is not managed by git
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

gt() {
  # "Nothing to see here, move along"
  is_in_git_repo || return

  # Pass the list of the tags to fzf-tmux
  # - "{}" in preview option is the placeholder for the highlighted entry
  # - Preview window can display ANSI colors, so we enable --color=always
  # - We can terminate `git show` once we have $LINES lines
  git tag --sort -version:refname |
    fzf-tmux --multi --preview-window right:70% \
             --preview 'git show --color=always {} | head -'$LINES
}

fi
