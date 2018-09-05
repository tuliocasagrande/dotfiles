#!/usr/bin/env bash

set -e

ln -s ~/dotfiles/.gitconfig ~/
ln -s ~/dotfiles/.vimrc ~/
ln -s ~/dotfiles/.tmux.conf ~/
ln -s ~/dotfiles/.inputrc ~/

mkdir ~/.jupyter/
ln -s ~/dotfiles/.jupyter/jupyter_notebook_config.py ~/.jupyter/

mkdir ~/.config/i3/ ~/.config/i3pystatus/
ln -s ~/dotfiles/.config/i3/config ~/.config/i3/
ln -s ~/dotfiles/.config/i3pystatus/config.py ~/.config/i3pystatus/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
