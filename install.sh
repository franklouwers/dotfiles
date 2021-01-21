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

### Install asdf plugins
. /usr/local/opt/asdf/asdf.sh
## Golang
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
# after go getting: asdf reshim golang
asdf install golang latest
asdf global golang $(asdf list golang)

## Helm
asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git
asdf install helm latest
asdf install helm 2.16.12 #oqton
asdf global helm 2.16.12

## NodeJS
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs lts
asdf global nodejs lts
. /usr/local/opt/asdf/asdf.sh
npm install --global yarn semver auth0-deploy-cli

## Ruby
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby $(asdf list ruby)
. /usr/local/opt/asdf/asdf.sh
# Install global ruby packages
gem install yaml2json

## Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

mkdir -p $HOME/.vim/swp/ $HOME/.vim/undodir

# vim stuff
# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

open -a Dropbox
open -a Docker

echo "best to run 'mackup restore' now, then reboot"
echo "may the force be with you!"
