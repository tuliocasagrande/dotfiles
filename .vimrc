set shell=/bin/bash

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage itself, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'tpope/vim-fugitive'          " git wrapper
Plugin 'bling/vim-airline'           " status bar
Plugin 'airblade/vim-gitgutter'      " git status next to lines
Plugin 'scrooloose/syntastic'        " syntax checking
Plugin 'ctrlpvim/ctrlp.vim'          " fuzzy finder
Plugin 'scrooloose/nerdtree'         " file system explorer
Plugin 'Xuyuanp/nerdtree-git-plugin' " NERDTree plugin showing git status
Plugin 'mileszs/ack.vim'             " search like grep, but faster

" Color schemes
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on

" set mapleader for extra key combinations
let mapleader = ","
let g:mapleader = ","

set number
syntax enable
set background=dark
colorscheme zenburn

set title      " set window title according to the open file
set autoread   " set to auto read when a file is changed from the outside
set encoding=utf8
set ffs=unix,dos,mac
set so=7
set wildmenu
set wildmode=longest:full,full
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set mat=2
set laststatus=2
set mouse=nvi  " don't use mouse in ex-mode
set clipboard=unnamed
set backspace=indent,eol,start
set cursorline

" use tab with 4 spaces
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" turn backup off
set nobackup
set nowb
set noswapfile

set ai           " auto indent
set si           " smart indent
set wrap
set linebreak
set nolist       " list disables linebreak
set textwidth=0
set wrapmargin=0

" some handy themes
nnoremap <leader>1 :colorscheme zenburn<cr>
nnoremap <leader>2 :colorscheme obsidian<cr>
nnoremap <leader>3 :colorscheme molokai<cr>
nnoremap <leader>4 :colorscheme badwolf<cr>

" strip trailing whitespace
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

" show trailing whitespace in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup whitespace
    autocmd!
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END

" remap movement to move by column layout
map j gj
map k gk
noremap <Down> gj
noremap <Up> gk

" toggle relative number
nnoremap <C-n> :set relativenumber!<CR>

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" NERDTree
map <C-b> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" let ack.vim use ag (the silver searcher)
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    cnoreabbrev ag Ack!
    cnoreabbrev Ag Ack!
    cnoreabbrev ack Ack!
    cnoreabbrev Ack Ack!
endif
