#!/usr/bin/env bash

ln -s ~/dotfiles/.gitconfig ~/
ln -s ~/dotfiles/.vimrc ~/
ln -s ~/dotfiles/.tmux.conf ~/
ln -s ~/dotfiles/.inputrc ~/

mkdir -p ~/.config/fish/functions/
ln -s ~/dotfiles/.config/fish/fish_variables ~/.config/fish/fish_variables
ln -s ~/dotfiles/.config/fish/functions/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
ln -s ~/dotfiles/.config/fish/functions/rm_dsstore.fish ~/.config/fish/functions/rm_dsstore.fish
ln -s ~/dotfiles/.config/fish/functions/mkcd.fish ~/.config/fish/functions/mkcd.fish

mkdir ~/.jupyter/
ln -s ~/dotfiles/.jupyter/jupyter_notebook_config.py ~/.jupyter/

mkdir -p ~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/
ln -s ~/dotfiles/.jupyter/shortcuts.jupyterlab-settings ~/.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension/

mkdir -p ~/.ipython/profile_default/
ln -s ~/dotfiles/.ipython/profile_default/ipython_kernel_config.py ~/.ipython/profile_default/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
