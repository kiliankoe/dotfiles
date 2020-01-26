eval (starship init fish)

set LANG en_US.UTF-8
# set EDITOR vim

# "Aliases"
function l
    command exa -l $argv
end

function cat
    command bat $argv
end

function fishconfig
    subl $HOME/.config/fish
end

function tmp
    cd $TMPDIR
end

function ginit
    command git init
    command git add .
    command git commit -m 'initial commit'
end

function mkcd
    command mkdir -p $argv && cd $argv
end

function dockerpwd
    command docker run --rm -it -v $PWD:/src $argv
end

function jupyter
    command docker run --name=jupyter -d -p 8080:8888 -v $HOME/dev/jupyter:/home/jovyan/work jupyter/datascience-notebook start.sh jupyter lab && open "http://localhost:8080" && docker logs jupyter
end

# Rust
set PATH $PATH $HOME/.cargo/bin
set CARGO_HOME $HOME/.cargo
set RUST_SRC_PATH $HOME/dev/rust/src

set PATH $PATH $HOME/bin

set ICLOUD_DRIVE $HOME/Library/Mobile\ Documents/com~apple~CloudDocs
