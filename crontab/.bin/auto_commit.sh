#!/bin/sh

# http://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions
# git status --porcelain | grep "^A" | cut -c 4-

log_info () { echo "--- INF ---: $1"; }
log_error () { echo "--- ERR ---: $1"; }

# PROJECT_PATH=$(pwd)
PROJECT_PATH=$1
SKIP_COMMIT=1

alias git='git -C $PROJECT_PATH'

log_info "current project: $PROJECT_PATH"

if [[ -z $(git status 2>/dev/null) ]]; then
  log_info "not a git repository"
else
  # current branch
  # work with git v1.7+
  CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
  # work with git v1.8+
  # git symbolic-ref --short HEAD
  log_info "current branch: $CURRENT_BRANCH"

  if [[ -z `git status --porcelain` ]]; then
    log_info "nothing to commit"

    git pull origin $CURRENT_BRANCH

    exit
  fi

  if [[ $SKIP_COMMIT -eq 1 ]]; then
    N_TITLE="$PROJECT_PATH"
    N_CONTENT="branch $CURRENT_BRANCH has uncommitted files."

    [[ $(uname) = 'Darwin' ]] && \
      osascript -e "display notification \"$N_CONTENT\" with title \"$N_TITLE\""

    exit
  fi

  # add all
  git add --all
  # commit
  git commit -m "[AUTO COMMIT] $(date +'%Y-%m-%d %T')"
  # auto push
  git push origin $CURRENT_BRANCH
fi
