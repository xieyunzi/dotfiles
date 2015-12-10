#!/bin/sh
cursor_up_one_line='\033[1A'
erase_eol='\033[K'

echo '#####                     (33%)'
sleep 1
echo "$cursor_up_one_line$erase_eol\r\c"
echo '#############             (66%)'
sleep 1
echo "$cursor_up_one_line$erase_eol\r\c"
echo '#######################   (100%)'
