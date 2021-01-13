#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
 if test ! $(which brew); then
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
 fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Install nodejs LTS using n
sudo mkdir /usr/local/n
sudo chown frank /usr/local/n
n install lts
n lts
# Install global NPM packages
npm install --global yarn semver auth0-deploy-cli


# Install latest ruby ruby
ruby-install ruby
chruby ruby
# Install global ruby packages
gem install yaml2json

## Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

mkdir -p $HOME/.vim/swp/ $HOME/.vim/undodir

# vim stuff
# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# go tools
go get -u golang.org/x/lint/golint

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

open -a Dropbox
open -a Docker

echo "best to run 'mackup restore' now, then reboot"
echo "may the force be with you!"
