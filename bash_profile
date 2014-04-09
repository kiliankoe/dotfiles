# useful and 'useful' aliases
alias please="sudo"
alias his="history | grep '$1'"
alias rsync='rsync --progress'
alias killakku="yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null &"
alias ping='ping -c 5'
alias df='df -H'
alias du='du -ch'
alias cpProgress='rsync --progress -ravz'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias ramdisk='diskutil erasevolume HFS+ "RAM Disk" `hdiutil attach -nomount ram://8388608`' # creates a 4GB ramdisk, otherwise -> 8388608 (4096 * 2048)
alias lf='/bin/ls -rt|tail -n1' #list last changed file
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30' #show frequent commands
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
function backup() { cp $1 $1.bak; }
function mcd() { mkdir -p "$1" && cd "$1"; } #mkdir && cd
function genfile() { dd if=/dev/zero of=file.bin bs=1024 count=0 seek=$[1024 * $1]; } #generate large file quickly, passed in MB
function subl() { open -a Sublime\ Text $1; }
function vlc() { open -a VLC $1; }
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# ssh aliases
alias abuntu="ssh kilian@10.211.55.30"

# ls aliases
alias ll='ls -lG'
alias l='ls -lAhG'
alias ls='ls -G'

# avoid making mistakes
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# git aliases
alias gg="git log --oneline --all --abbrev-commit --graph --decorate --color"
alias gs="git status -s"
rgc() { git commit -m"`curl -s http://whatthecommit.com/index.txt`"; } #random git commit message
alias git=hub

# history stuff
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth #fuegt keine direkt aufeinander folgenden duplikat zeilen oder mit leerzeichen startenden zeilen

# change locale
export LANG=en_US.UTF-8

# set default editor
export EDITOR=vim

# colors!
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# virtualenv
export WORKON_HOME=~/envs
source /usr/local/bin/virtualenvwrapper.sh

export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/usr/texbin:/usr/local/heroku/bin'
