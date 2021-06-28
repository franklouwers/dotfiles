#!/bin/bash

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

### Install asdf plugins
. $(brew --prefix)/opt/asdf/asdf.sh

## Golang
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
# after go getting: asdf reshim golang
asdf install golang latest
asdf global golang $(asdf list golang)
. $(brew --prefix)/opt/asdf/asdf.sh
go get golang.org/x/tools/cmd/goimports

## NodeJS
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
#asdf install nodejs lts
#asdf global nodejs lts
asdf install nodejs 16.4.0
asdf global nodejs 16.4.0
. $(brew --prefix)/opt/asdf/asdf.sh

## Ruby
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby $(asdf list ruby)
. $(brew --prefix)/opt/asdf/asdf.sh
# Install global ruby packages
gem install yaml2json

## Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg


# vim stuff
# vundle
#mkdir -p $HOME/.vim/swp/ $HOME/.vim/undodir
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# vim lsp
npm install --global dockerfile-language-server-nodejs # dockerfile
npm install --global yarn
gem install --user-install solargraph # ruby

npm install --global @funboxteam/optimizt # optmize images for the web

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

open -a Dropbox
open -a Docker

# only now install Rosetta2. Everything above should (?) work without Rosetta2 :)

echo 'If you wish to install Rosetta2, run the following command:'
echo ''
echo '  sudo softwareupdate --install-rosetta'
echo ''

# requires rosetta!
## Helm
asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git
asdf install helm latest
arch -x86_64 asdf install helm 2.16.12 #oqton
asdf global helm 2.16.12



echo "best to run 'mackup restore' now, then reboot"
echo "may the force be with you!"
