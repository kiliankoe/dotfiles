# useful and 'useful' aliases
alias please="sudo"
alias his="history | grep '$1'"
alias rsync='rsync --progress'
alias killakku="yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null &"
alias ping='ping -c 5'
alias df='df -H'
alias du='du -ch'
alias cpProgress='rsync --progress -ravz'
alias md5='md5 -r'

# other aliases
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias ramdisk='diskutil erasevolume HFS+ "tmpdisk" `hdiutil attach -nomount ram://8388608`' # creates a 4GB ramdisk, otherwise -> 8388608 (4096 * 2048)
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30' #show frequent commands
alias noshadows='~/develop/toggle-osx-shadows/toggle-osx-shadows'
alias slogger='~/scripts/Slogger/slogger'

# useful functions
function manpdf() { man -t "${1}" | open -f -a /Applications/Preview.app/; }
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

# ls aliases
alias ll='ls -lG'
alias l='ls -lAhG'
alias ls='ls -G'
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias lf='/bin/ls -rt|tail -n1' #list last changed file

# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# git aliases
alias gg="git log --oneline --all --abbrev-commit --graph --decorate --color"
alias gis="git status -s"
alias gd="git diff"
alias gist="open -a SourceTree ."
rgc() { git commit -m"`curl -s http://whatthecommit.com/index.txt`"; } #random git commit message
alias git=hub
function gi() { curl http://www.gitignore.io/api/$@ ;}
# function gdate() { git filter-branch -f --env-filter 'if [ $GIT_COMMIT = ' + $1 + ' ] then export GIT_AUTHOR_DATE='+ $2 + ' export GIT_COMMITTER_DATE=' + $2 + ' fi'; }

# history stuff
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth #fuegt keine direkt aufeinander folgenden duplikat zeilen oder mit leerzeichen startenden zeilen

# change locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# set default editor
export EDITOR="open -a 'Sublime Text'"

# git branch in prompt
# $(__git_ps1 "(%s)")
source ~/bin/git-prompt.sh

# colors!
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]:$(__git_ps1 "(%s)")\$ '

# node.js magic
alias npm-exec='PATH=$(npm bin):$PATH'

# virtualenv
export WORKON_HOME=~/develop/envs
# source /usr/local/bin/virtualenvwrapper.sh

# enable bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export ANDROID_HOME=/Applications/android-sdk
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/usr/texbin:/usr/local/heroku/bin:$ANDROID_HOME:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:/Applications/VirtualBox.app/Contents/MacOS:$PATH

# source ~/.profile
source ~/bin/alias.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
