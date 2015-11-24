#!/bin/sh

log_info () { echo "--- INF ---: $1"; }

AUTO_PUSH=
PROJECT_PATH=$1
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`

log_info "project path: $PROJECT_PATH"

alias pgit='git -C $PROJECT_PATH'

# update submodule
pgit submodule foreach git checkout master
pgit submodule foreach git pull origin master

# add all
pgit add --all

# commit
pgit commit -m "update submodule $(date +'%Y-%m-%d %T')"

# auto push
log_info "current branch: $CURRENT_BRANCH"
[[ $AUTO_PUSH -eq 1 ]] && pgit push origin $CURRENT_BRANCH
