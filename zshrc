export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="norm-kilian" # mh and norm are pretty nice
DEFAULT_USER="kilian"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting z)
COMPLETION_WAITING_DOTS="true"

zstyle ':omz:update' mode reminder
source $ZSH/oh-my-zsh.sh

HISTSIZE=10000000
SAVEHIST=10000000

setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
# setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
# setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.

# report time a command took if it's longer than n seconds
REPORTTIME=5

# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

export EDITOR="hx"
export ICLOUD_DRIVE="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
export PATH="$PATH:$HOME/bin"

# fixes mouse scrolling in bat's pager output in tmux
export LESS="--mouse"

source ~/dev/dotfiles/private

alias df='df -H'
alias du='du -ch'
alias lg='lazygit'
alias rsync='rsync --progress'
alias tree='tree -C'
alias zshconfig="code ~/dev/dotfiles/zshrc"
alias zshreload="source ~/dev/dotfiles/zshrc"

alias l='ls -lAhG'
alias ls='ls -G'
alias lsd='ls -Gal | grep ^d' # only list directories, including hidden ones
alias lf='/bin/ls -rt | tail -n1' # list last changed file

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

function mkcd() { mkdir -p "$1" && cd "$1"; }

alias dockerpwd='docker run --rm -it -v $(PWD):/src'

eval "$(atuin init zsh --disable-up-arrow)"
