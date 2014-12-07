# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="mh"
# mh and norm are pretty nice

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git brew npm sublime rails)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/usr/texbin:/Users/kilian/.rvm/gems/ruby-2.0.0-p481@railstutorial_rails_4_0/bin:/Users/kilian/.rvm/gems/ruby-2.0.0-p481@global/bin:/Users/kilian/.rvm/rubies/ruby-2.0.0-p481/bin:/usr/local/heroku/bin:/Applications/android-sdk:/Applications/android-sdk/tools:/Applications/android-sdk/platform-tools:/Applications/VirtualBox.app/Contents/MacOS:/Users/kilian/.rvm/bin:/Users/kilian/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='mvim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# enable syntax completion
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enable z for quick filesystem navigation
. `brew --prefix`/etc/profile.d/z.sh

# useful and 'useful' aliases
alias zshconfig="subl ~/dotfiles/zshrc"
alias please="sudo"
alias killakku="yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null &"
alias cpProgress='rsync --progress -ravz'

# redefinitions and safety
alias md5='md5 -r'
alias df='df -H'
alias du='du -ch'
alias rsync='rsync --progress'

# other aliases and system stuff
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias ramdisk='diskutil erasevolume HFS+ "tmpdisk" `hdiutil attach -nomount ram://8388608`' # creates a 4GB ramdisk, otherwise -> 8388608 (4096 * 2048)
alias noshadows='~/develop/toggle-osx-shadows/toggle-osx-shadows'
alias slogger='~/scripts/Slogger/slogger'

# useful functions
function manpdf() { man -t "${1}" | open -f -a /Applications/Preview.app/; }
function backup() { cp $1 $1.bak; }
function mcd() { mkdir -p "$1" && cd "$1"; } #mkdir && cd
function genfile() { dd if=/dev/zero of=file.bin bs=1024 count=0 seek=$[1024 * $1]; } #generate large file quickly, passed in MB
function mpx() { open -a MPlayerX $1; }
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
rgc() { git commit -m"`curl -s http://whatthecommit.com/index.txt`"; } #random git commit message
alias git=hub
function gi() { curl http://www.gitignore.io/api/$@ ;}
function str() {
    if [ $# -eq 0 ] ; then
        open -a SourceTree .
    else
        open -a SourceTree $1
    fi
}
# function gdate() { git filter-branch -f --env-filter 'if [ $GIT_COMMIT = ' + $1 + ' ] then export GIT_AUTHOR_DATE='+ $2 + ' export GIT_COMMITTER_DATE=' + $2 + ' fi'; }

# history stuff
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth #fuegt keine direkt aufeinander folgenden duplikat zeilen oder mit leerzeichen startenden zeilen

# set default editor
export EDITOR="open -a 'Sublime Text'"

# node.js magic
alias npm-exec='PATH=$(npm bin):$PATH'

# virtualenv
alias activate='source ./venv/bin/activate'
export WORKON_HOME=~/develop/envs
source /usr/local/bin/virtualenvwrapper.sh

export ANDROID_HOME=/Applications/android-sdk

# source ~/.profile
source ~/scripts/alias.sh

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
