# NOTE: Sublime text is aliased as "st", through a symlink in /usr/bin.
#Sets SVN, GVS and default editors to Sublime Text 2
export EDITOR="st -w"
export CVSEDITOR="st -w"
export SVN_EDITOR="st -w"

# common typos
alias ts='st'
alias st.='st .'

#Alias for wget
alias wget="curl -O"

# Start SQL
alias smysql="/usr/local/bin/mysql.server start"

# # Enable shims and autocompletion for rbenv
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# More Git aliases
alias git='hub'
alias g='git'
alias gst='git status -s'
alias gpull='git pull'
alias gp='git push'
alias gf='git fetch'
alias gd='git difftool'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -m'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias glog='git log --oneline --decorate'
alias glogg='git log --oneline --decorate --graph'
alias glogs='git log --oneline --decorate --stat'
alias gcl='git clone'
alias gdc='git difftool --cached'

# #Aliases for ls
alias ll='ls -lh'
alias l='ls -lhA'
alias lsa='ls -a'

alias rm='rm -i'

#Apache commands
alias apaches='sudo apachectl start'
alias apacher='sudo apachectl restart'
alias apachestop='sudo apachectl stop'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Faster npm for europeans
command -v npm > /dev/null && alias npme="npm --registry http://registry.npmjs.eu"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev="cd ~/Dropbox/dev"
alias inbox="cd ~/Dropbox/Inbox"
alias docs="cd ~/Dropbox/Documents"
alias docsl="cd ~/Documents"
alias raf="cd ~/RAF"
alias sparta="cd ~/Dropbox/Documents/Sparta"
alias sshsparta="ssh -X danny@unix.spartaglobal.com -R 52698:localhost:52698"
