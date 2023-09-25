#!/bin/bash

echo "Setting up your Linux reduced system..."

mkdir -p ~/.ssh/control
chmod 700 ~/.ssh
ln -s $HOME/.dotfiles/.ssh_config $HOME/.ssh/config

# zsh files from here...
ln -s $HOME/.dotfiles/.zshrc $HOME/
ln -s $HOME/.dotfiles/.zsh $HOME/

# git config
ln -s $HOME/.dotfiles/.gitconfig $HOME/

# Neovim files from repo
mkdir -p $HOME/.config
git clone git@github.com:franklouwers/neovim-config.git $HOME/.config/nvim

# starship config
ln -s $HOME/.dotfiles/starship.toml $HOME/.config/
