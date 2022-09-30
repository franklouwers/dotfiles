# Init ZPLUG
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# asdf
. $(brew --prefix)/opt/asdf/asdf.sh

# aliases
source $HOME/.zsh/aliases.zsh

# plugins
source $HOME/.zsh/plugins.zsh # load plugins
source $HOME/.zsh/plugin-config.zsh # config plugins


# default settings (not plugin specific)
source $HOME/.zsh/defaults.zsh

# Oqton specific
source $HOME/.zsh/_notpublic-oqton.zsh

## Zplug needs update?
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
