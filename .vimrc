set shell=/bin/bash
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on

set autoread

set so=7
set wildmenu
set wildmode=longest:full,full
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set mat=2

set noeb vb t_vb=
au GUIEnter * set vb t_vb=

set number

syntax enable
colorscheme neon
set background=dark

set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=80

set backspace=indent,eol,start

set ai
set si
set wrap
set linebreak
set nolist

set textwidth=0
set wrapmargin=0

set laststatus=2

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

let mapleader = ","
let g:mapleader = ","

map j gj
map k gk

map <leader>t :CtrlP<CR>
map \ :NERDTreeToggle<CR>
map <leader>z :tabp<CR>
map <leader>x :tabn<CR>

let NERDTreeIgnore = ['\.pyc$']
