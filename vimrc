" Load Pathogen plugins
" execute pathogen#infect()

let mapleader="," " leader is comma instead of \

syntax enable " syntax highlighting

set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces

set ruler " current line number on status bar
set number " show line numbers
set showcmd " show last command in status bar

set cursorline " highlight current line

filetype indent on " load filetype-specific indent files

set wildmenu " visual autocomplete for command menu

set lazyredraw " redraw only when necessary

set showmatch " highlight matching [{()}]

set incsearch " search as characters are entered
set hlsearch " highlight search matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 

"set nowrap					" no line wrapping

" Magic indentation
" filetype indent plugin on

" Use dark solarized theme
" set background=dark
" colorscheme solarized

