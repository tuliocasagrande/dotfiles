#!/usr/bin/env bash

##### MISC #####
ln -s ~/dotfiles/.gitconfig ~/
ln -s ~/dotfiles/.vimrc ~/
ln -s ~/dotfiles/.tmux.conf ~/
ln -s ~/dotfiles/.inputrc ~/

##### FISH #####
FISH_DIR=.config/fish
mkdir -p ~/$FISH_DIR/functions/
ln -s ~/dotfiles/$FISH_DIR/fish_variables ~/$FISH_DIR/fish_variables
ln -s ~/dotfiles/$FISH_DIR/functions/fish_prompt.fish ~/$FISH_DIR/functions/fish_prompt.fish
ln -s ~/dotfiles/$FISH_DIR/functions/rm_dsstore.fish ~/$FISH_DIR/functions/rm_dsstore.fish
ln -s ~/dotfiles/$FISH_DIR/functions/mkcd.fish ~/$FISH_DIR/functions/mkcd.fish

##### JUPYTER #####

# Jupyter auto-save
CONFIG_DIR=.jupyter
CONFIG_FILE=jupyter_notebook_config.py
mkdir -p ~/$CONFIG_DIR
ln -s ~/dotfiles/$CONFIG_DIR/$CONFIG_FILE ~/$CONFIG_DIR

# Jupyter LSP
CONFIG_DIR=.jupyter/lab/user-settings/@jupyter-lsp/jupyterlab-lsp
CONFIG_FILE=completion.jupyterlab-settings
mkdir -p ~/$CONFIG_DIR
ln -s ~/dotfiles/$CONFIG_DIR/$CONFIG_FILE ~/$CONFIG_DIR
CONFIG_FILE=plugin.jupyterlab-settings
ln -s ~/dotfiles/$CONFIG_DIR/$CONFIG_FILE ~/$CONFIG_DIR

# Jupyter file editor
CONFIG_DIR=.jupyter/lab/user-settings/@jupyterlab/fileeditor-extension
CONFIG_FILE=plugin.jupyterlab-settings
mkdir -p ~/$CONFIG_DIR
ln -s ~/dotfiles/$CONFIG_DIR/$CONFIG_FILE ~/$CONFIG_DIR

# Jupyter notebook editor
CONFIG_DIR=.jupyter/lab/user-settings/@jupyterlab/notebook-extension
CONFIG_FILE=tracker.jupyterlab-settings
mkdir -p ~/$CONFIG_DIR
ln -s ~/dotfiles/$CONFIG_DIR/$CONFIG_FILE ~/$CONFIG_DIR

# Jupyter shortcuts
CONFIG_DIR=.jupyter/lab/user-settings/@jupyterlab/shortcuts-extension
CONFIG_FILE=shortcuts.jupyterlab-settings
mkdir -p ~/$CONFIG_DIR
ln -s ~/dotfiles/$CONFIG_DIR/$CONFIG_FILE ~/$CONFIG_DIR

# Jupyter code formatter extension
CONFIG_DIR=.jupyter/lab/user-settings/jupyterlab_code_formatter
CONFIG_FILE=settings.jupyterlab-settings
mkdir -p ~/$CONFIG_DIR
ln -s ~/dotfiles/$CONFIG_DIR/$CONFIG_FILE ~/$CONFIG_DIR

##### IPYTHON #####
# Configure matplotlib to use high resolution images, may be obsolete as of 2024
CONFIG_DIR=.ipython/profile_default
CONFIG_FILE=ipython_kernel_config.py
mkdir -p ~/$CONFIG_DIR/
ln -s ~/dotfiles/$CONFIG_DIR/$CONFIG_FILE ~/$CONFIG_DIR

##### VIM #####
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
