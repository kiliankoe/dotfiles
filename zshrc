# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="norm-kilian"
# mh and norm are pretty nice

# ZSH_THEME="powerlevel9k"
DEFAULT_USER="kilian"

# Check me for colors:
# for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

plugins=(git brew sublime history-substring-search zsh-syntax-highlighting)
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# Bind UP and DOWN arrow keys for history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export LANG=en_US.UTF-8

# set default editor
export EDITOR="vim"

# add hombrew's sbin to PATH
export PATH="/usr/local/sbin:$PATH"

# enable z for quick filesystem navigation
. `brew --prefix`/etc/profile.d/z.sh

export PATH="$PATH:$HOME/bin"
source ~/bin/alias.sh
# source ~/.profile

# prevent homebrew from automatically updating (why once a minute?!)
HOMEBREW_NO_AUTO_UPDATE=1

# useful and 'useful' aliases
alias zshconfig="subl ~/dotfiles/zshrc"
alias zshreload="source ~/dotfiles/zshrc"
alias please="sudo !!"
alias killakku="yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null &"
alias cpProgress='rsync --progress -ravz'
alias dev='cd $HOME/dev'
alias gping='ping 8.8.8.8'
alias tmp='cd $TMPDIR'

# redefinitions and safety
alias md5='md5 -r'
alias df='df -H'
alias du='du -ch'
alias rsync='rsync --progress'

# other aliases and system stuff
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias ramdisk='diskutil erasevolume HFS+ "tmpdisk" `hdiutil attach -nomount ram://8388608`' # creates a 4GB ramdisk, otherwise -> 8388608 (4096 * 2048)
alias mc='java -d64 -Xmx4096M -jar /Applications/Minecraft.app/Contents/Resources/Java/Bootstrap.jar'
alias til='cd ~/til && str && subl .'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com' # faster than a lookup via http
# alias emacs='emacs'

# useful functions
function manpdf() { man -t "${1}" | open -f -a /Applications/Preview.app/; }
alias randman='man $(find /usr/share/man -type f | sort -R | head -n1)'
function backup() { cp $1 $1.bak; }
function mkcd() { mkdir -p "$1" && cd "$1"; } #mkdir && cd
function genfile() { dd if=/dev/zero of=file.bin bs=1024 count=0 seek=$[1024 * $1]; } #generate large file quickly, passed in MB
function mpx() { open -a MPlayerX $1; }
function anybar { echo -n $1 | nc -4u -w0 localhost ${2:-1738}; }
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
alias lsd='ls -Gal | grep ^d' # only list directories, including hidden ones
alias lf='/bin/ls -rt|tail -n1' # list last changed file

# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# git aliases
alias glog="git log --oneline --all --abbrev-commit --graph --decorate --color"
alias gst="git status -s"
alias gdiff="git diff --word-diff"
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
function ginit() {
    git init
    git add .
    git commit -m 'initial commit'
}
# function gdate() { git filter-branch -f --env-filter 'if [ $GIT_COMMIT = ' + $1 + ' ] then export GIT_AUTHOR_DATE='+ $2 + ' export GIT_COMMITTER_DATE=' + $2 + ' fi'; }

# report time a command took if it's longer than n seconds
REPORTTIME=5

# history
HISTSIZE=10000000
SAVEHIST=10000000

setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.

# iTerm shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# iCloud
export ICLOUD_DRIVE="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

############################################################
# Random settings/aliases for some languages / environments
############################################################

# node.js
alias npm-exec='PATH=$(npm bin):$PATH'

# python's virtualenv
alias activate='source ./venv/bin/activate'
export WORKON_HOME=~/dev/envs
alias pip='pip3'
# source /usr/local/bin/virtualenvwrapper.sh

# go
export GOPATH="$HOME/dev/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"

# rust
export PATH="$PATH:$HOME/.cargo/bin"
export CARGO_HOME="$HOME/.cargo"
export RUST_SRC_PATH="$HOME/dev/rust/src"

# ruby/rbenv
export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init -)"

# php/composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# C++
alias c11='clang++ -std=c++11'

# Xcode
function xc() { xcodebuild $@ | xcpretty }

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# has to stay at the end of the file
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
