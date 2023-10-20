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


#########
# general
#########

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR="emacs"

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
# homebrew's sbin
export PATH="/usr/local/sbin:$PATH"

# Bind UP and DOWN arrow keys for history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

export ICLOUD_DRIVE="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

source ~/dev/dotfiles/private

# report time a command took if it's longer than n seconds
REPORTTIME=5

# iTerm shell integration
# test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh


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

alias l='ls -lAhG'
alias ls='ls -G'
alias lsd='ls -Gal | grep ^d' # only list directories, including hidden ones
alias lf='/bin/ls -rt | tail -n1' # list last changed file

alias tree='tree -C'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

function mkcd() { mkdir -p "$1" && cd "$1"; }

alias df='df -H'
alias du='du -ch'
alias rsync='rsync --progress'

alias ngrok='lt'
alias toggledark="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"

# creates a 4GB ramdisk, otherwise -> 8388608 (4096 * 2048)
alias ramdisk='diskutil erasevolume HFS+ "tmpdisk" `hdiutil attach -nomount ram://8388608`'
alias manrand='man $(find /usr/share/man -type f | sort -R | head -n1)'

function manpdf() { man -t "${1}" | open -f -a /Applications/Preview.app; }

# homebrew
alias buo='brew update && brew outdated'
alias buc='brew upgrade && brew cleanup'

# docker
alias dockerpwd='docker run --rm -it -v $(PWD):/src'
alias doc='docker-compose'

# specific docker images
alias jupyter='docker run --name=jupyter -d -p 8080:8888 -v /Users/kilian/dev/jupyter:/home/jovyan/work jupyter/datascience-notebook start.sh jupyter lab && open "http://localhost:8080" && docker logs jupyter'

# swift
spm () {
    swift "$@" 2>&1 | xcbeautify
}

# rust
export PATH="$PATH:$HOME/.cargo/bin"
export CARGO_HOME="$HOME/.cargo"
export RUST_SRC_PATH="$HOME/dev/rust/src"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
