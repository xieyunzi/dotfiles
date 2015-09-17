#                 ██      
#                ░██      
#  ██████  ██████░██      
# ░░░░██  ██░░░░ ░██████  
#    ██  ░░█████ ░██░░░██ 
#   ██    ░░░░░██░██  ░██ 
#  ██████ ██████ ░██  ░██ 
# ░░░░░░ ░░░░░░  ░░   ░░  
#
#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ author ▓ xero <x@xero.nu>
# ░▓ code   ▓ http://code.xero.nu/dotfiles
# ░▓ mirror ▓ http://git.io/.files
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
#
#█▓▒░ aliases
alias ll="ls -lah --color=auto"
alias ls="ls --color=auto"
alias lsl="ls -lh --color=auto"
alias "cd.."="cd ../"
alias up="cd ../"
alias v="vim"
alias vi="vim"
alias g="hub"
alias git="hub"
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias rock="ncmpcpp"
alias mixer="alsamixer"
alias genplaylist="cd ~/music;find . -name '*.mp3' -o -name '*.flac'|sed -e 's%^./%%g' > ~/.mpd/playlists/all.m3u"
alias matrix="cmatrix -b"
alias pipes="bash ~/code/fun/pipes"
alias pipesx="bash ~/code/fun/pipesx"
alias rain="bash ~/code/fun/rain"
alias screenfetch="~/code/sys/info"
alias hashcompare="bash ~/code/sys/hash-compare "
alias tempwatch="while :; do sensors; sleep 1 && clear; done;"
alias term="urxvtc -hold -e " #used for run menu
alias tmx="bash ~/code/sys/tmx"
alias fixcursor="xsetroot -cursor_name left_ptr"
alias img="bash ~/code/sys/img"
alias gitio="bash ~/code/sys/gitio"
alias ix="bash ~/code/sys/ix"
alias ioup="~/code/sys/ioup"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias clbin="curl -F 'clbin=<-' https://clbin.com"
alias toiletlist='for i in ${TOILET_FONT_PATH:=/usr/share/figlet}/*.{t,f}lf; do j=${i##*/}; echo ""; echo "╓───── "$j; echo "╙────────────────────────────────────── ─ ─ "; echo ""; toilet -d "${i%/*}" -f "$j" "${j%.*}"; done'
alias ascii="toilet -t -f 3d"
alias future="toilet -t -f future"
alias rusto="toilet -t -f rusto"
alias rustofat="toilet -t -f rustofat"
alias pacman="sudo pacman"
alias systemctl="sudo systemctl"
alias apachereload='sudo systemctl restart httpd.service'
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'
alias todo="bash ~/code/sys/todo"
alias record="ffmpeg -f x11grab -s 1366x768 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y " #pass a filename
email() {
	echo $3 | mutt -s $2 $1
}
pcat() {
	pygmentize -f terminal256 -O style=monokai -g
}
pless() {
	pygmentize -f terminal256 -O style=monokai -g $1 | less -r
}
# read markdown files like manpages
md() {
    pandoc -s -f markdown -t man "$*" | man -l -
}
