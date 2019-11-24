#!/usr/bin/env bash

set -e

ln -s ~/dotfiles/.gitconfig ~/
ln -s ~/dotfiles/.vimrc ~/
ln -s ~/dotfiles/.tmux.conf ~/
ln -s ~/dotfiles/.inputrc ~/

mkdir ~/.jupyter/
ln -s ~/dotfiles/.jupyter/jupyter_notebook_config.py ~/.jupyter/

mkdir ~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/
ln -s ~/dotfiles/.jupyter/shortcuts.jupyterlab-settings ~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/

mkdir -p ~/.ipython/profile_default/
ln -s ~/dotfiles/.ipython/profile_default/ipython_kernel_config.py ~/.ipython/profile_default/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
