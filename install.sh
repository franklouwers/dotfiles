#!/bin/bash

echo "Setting up your Mac..."

mkdir -p ~/.ssh/control
chmod 700 ~/.ssh
ln -s $HOME/.dotfiles/.ssh_config $HOME/.ssh/config

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/$USER/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# We use submodules in this repo...
git submodule init
git submodule update

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

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

### Install asdf plugins
. $(brew --prefix)/opt/asdf/libexec/asdf.sh

## Golang
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
# after go getting: asdf reshim golang
asdf install golang latest
asdf global golang $(asdf list golang)
. $(brew --prefix)/opt/asdf/libexec/asdf.sh
go install golang.org/x/tools/cmd/goimports@latest

## NodeJS
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
#bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
#asdf install nodejs lts
#asdf global nodejs lts
asdf install nodejs 18.18.0
asdf global nodejs 18.18.0
. $(brew --prefix)/opt/asdf/libexec/asdf.sh

## Ruby
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby $(asdf list ruby)
. $(brew --prefix)/opt/asdf/libexec/asdf.sh
# Install global ruby packages
gem install yaml2json
gem install solargraph
gem install ruby-lsp

## Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# vim lsp
npm install --global dockerfile-language-server-nodejs # dockerfile
npm install --global yarn

npm install --global @funboxteam/optimizt # optmize images for the web ### TODO: fix me
npm install -i -g yaml-language-server    # yamlls
npm install -i -g bash-language-server    # yamlls

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

open -a Dropbox

# requires rosetta!
## Helm
asdf plugin-add helm
asdf install helm latest

#ssh-add --apple-use-keychain ~/.ssh/id_*

# new style auth plugin for gcloud
gcloud components install gke-gcloud-auth-plugin

mkdir -p $HOME/bin
cp -a bin/* $HOME/bin
mkdir -p $HOME/.config/swiftbar
cp ipv6-toggle.1s.sh $HOME/.config/swiftbar

### mark-text isn't properly signed
# needed as long as https://github.com/marktext/marktext/issues/2983 is open
xattr -r -d com.apple.quarantine /Applications/MarkText.app

# only now install Rosetta2. Everything above should (?) work without Rosetta2 :)

echo 'If you wish to install Rosetta2, run the following command:'
echo ''
echo '  sudo softwareupdate --install-rosetta'
echo ''

echo "may the force be with you!"
