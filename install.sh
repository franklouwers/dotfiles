#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle


# Install PHP extensions with PECL
#pecl install memcached imagick

# Install Composer
#curl -sS https://getcomposer.org/installer | php
#mv composer.phar /usr/local/bin/composer

## Install global Composer packages
#/usr/local/bin/composer global require laravel/installer laravel/spark-installer laravel/valet

## Install Laravel Valet
#$HOME/.composer/vendor/bin/valet install

# Install nodejs LTS using n
n install lts
n lts

# Install global NPM packages
npm install --global yarn

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

## Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

mkdir -p $HOME/.vim/swp/ $HOME/.vim/undodir

# vim stuff
# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

# go tools
go get -u golang.org/x/lint/golint
