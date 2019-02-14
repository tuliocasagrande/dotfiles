#!/usr/bin/env bash

set -e

ln -s ~/dotfiles/.gitconfig ~/
ln -s ~/dotfiles/.vimrc ~/
ln -s ~/dotfiles/.tmux.conf ~/
ln -s ~/dotfiles/.inputrc ~/
ln -s ~/dotfiles/.bashrc ~/
ln -s ~/dotfiles/.git-prompt-colors-sh ~/

mkdir ~/.jupyter/
ln -s ~/dotfiles/.jupyter/jupyter_notebook_config.py ~/.jupyter/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
