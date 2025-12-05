" V IMproved
set nocompatible
filetype off " Do not detect the file type

" Sets the line numbers
set number
set relativenumber

set tabstop=2
set shiftwidth=2
set autoindent
set expandtab		" convert tabs to spaces
set smarttab
set smartindent

set wrap " wrap lines

set hlsearch " highlight searches
set incsearch
set smartcase

set t_Co=256
colorscheme industry 
set background=dark

set wildmenu

set colorcolumn=80

syntax enable 

set laststatus=2 " show statusline
set statusline=%#LineNr#
set statusline+=\ %f
