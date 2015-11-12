if [[ ! $DOT_SHELL_LIB_ALIAS -eq 1 ]]; then
DOT_SHELL_LIB_ALIAS=1

alias l="ls -lhT"
alias ll="ls -alhT"

alias g=git
alias tm=tmux

# vi clean
alias vic="vi --noplugin"
alias vimc="vim --noplugin"

# use neovim
if [[ $HAS_NVIM -eq 1 ]]; then alias vi=nvim; fi

# wget alias
# http://www.mymacosx.com/terminal/wget-replacement-macos.html
# http://superuser.com/questions/142459/persistent-retrying-resuming-downloads-with-curl
alias wget="curl -O --retry 999 --retry-max-time 0 -C -"

if [[ $IS_MAC -eq 1 ]]; then
  alias psqlstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
  alias psqlstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
  # alias psqlstop='pg_ctl stop'
fi

#alias for cnpm
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

# for fzf https://github.com/junegunn/fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore ".git" -g ""'
export FZF_DEFAULT_OPTS="--reverse --inline-info"
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_TMUX_HEIGHT=20

fi
