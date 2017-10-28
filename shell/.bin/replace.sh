#!/bin/sh

rg -l "$1" | xargs sed -i bak "s/$1/$2/g"
