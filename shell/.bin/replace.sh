#!/bin/sh
# https://stackoverflow.com/questions/25486667/sed-without-backup-file
rg -l "$1" | xargs sed -i '' "s/$1/$2/g"
