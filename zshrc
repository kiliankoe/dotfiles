###########
# oh-my-zsh
###########

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="norm-kilian" # mh and norm are pretty nice
DEFAULT_USER="kilian"

# Check me for colors:
# for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"

plugins=(git sublime history-substring-search zsh-autosuggestions zsh-syntax-highlighting zsh-z)
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh



###############
# General stuff
###############

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR="emacs"

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.mint/bin"
# homebrew's sbin
export PATH="/usr/local/sbin:$PATH"

# source ~/bin/alias.sh

# Bind UP and DOWN arrow keys for history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# enable z for quick filesystem navigation
# . `brew --prefix`/etc/profile.d/z.sh
export ICLOUD_DRIVE="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

# iTerm shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

export BAT_THEME="Monokai Extended Light"


################################
# long running command reporting
################################

# report time a command took if it's longer than n seconds
REPORTTIME=5

# Modify preexec to report run duration
preexec() {
  PREEXEC_START_TIME=$(date +%s)
  PREEXEC_COMMAND=$1
}

# Send a macOS notification if the command took longer than 5 seconds to execute
precmd() {
  if [ -n "$PREEXEC_START_TIME" ]; then
    local END_TIME=$(date +%s)
    local DURATION=$((END_TIME - PREEXEC_START_TIME))

    if (( DURATION >= REPORTTIME )); then
      # osascript -e "display notification \"Finished after $DURATION seconds\" with title \"$PREEXEC_COMMAND\""
      terminal-notifier -title "$PREEXEC_COMMAND" -message "Finished after $DURATION seconds" -actions "OK" -timeout 0
    fi
  fi
}


#########
# history
#########

HISTSIZE=10000000
SAVEHIST=10000000

setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.



#########
# aliases
#########

alias zshconfig="code ~/dev/dotfiles/zshrc"
alias zshreload="source ~/dev/dotfiles/zshrc"
alias tmp='cd $TMPDIR'
alias ytdl='youtube-dl'

alias l='ls -lAhG'
alias ls='ls -G'
# alias lsd='ls -Gal | grep ^d' # only list directories, including hidden ones
alias lf='/bin/ls -rt | tail -n1' # list last changed file

alias tree='tree -C'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias df='df -H'
alias du='du -ch'
alias rsync='rsync --progress'

alias toggledark="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"

# creates a 4GB ramdisk, otherwise -> 8388608 (4096 * 2048)
alias ramdisk='diskutil erasevolume HFS+ "tmpdisk" `hdiutil attach -nomount ram://8388608`'
alias manrand='man $(find /usr/share/man -type f | sort -R | head -n1)'

function manpdf() { man -t "${1}" | open -f -a /Applications/Preview.app; }
function bak() { cp $1 $1.bak; }
function mkcd() { mkdir -p "$1" && cd "$1"; }
#generate large file quickly, passed in MB
function genfile() { dd if=/dev/zero of=file.bin bs=1024 count=0 seek=$[1024 * $1]; }
function extract() {
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

# highlight
# args: 1: size, 2: lang
# styles: http://www.andre-simon.de/doku/highlight/en/theme-samples.php
function keycode() {
    pbpaste | \
    highlight \
        --font Menlo \
        --font-size $1 \
        --src-lang $2 \
        --style Andes \
        --out-format rtf | \
    pbcopy
}

# docker
alias dockerpwd='docker run --rm -it -v $(PWD):/src'
alias doc='docker-compose'

# specific docker images
alias jupyter='docker run --name=jupyter -d -p 8080:8888 -v /Users/kilian/dev/jupyter:/home/jovyan/work jupyter/datascience-notebook start.sh jupyter lab && open "http://localhost:8080" && docker logs jupyter'

# swift
spm () {
    swift "$@" 2>&1 | xcbeautify
}

# python/virtualenv
alias activate='source ./venv/bin/activate'
export WORKON_HOME=~/dev/envs
export PIPENV_VENV_IN_PROJECT=1 # always create pipenv vens in the same dir
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

# go
# export GOPATH="$HOME/dev/go"
# export GOBIN="$GOPATH/bin"
# export PATH="$PATH:$GOBIN"

# rust
export PATH="$PATH:$HOME/.cargo/bin"
export CARGO_HOME="$HOME/.cargo"
export RUST_SRC_PATH="$HOME/dev/rust/src"

# Bundle
alias be='bundle exec'
alias bef='bundle exec fastlane'
alias bep='bundle exec pod'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
