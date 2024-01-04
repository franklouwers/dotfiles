# Init ZPLUG
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# aliases
source $HOME/.zsh/aliases.zsh

# plugins
source $HOME/.zsh/plugin-config-pre.zsh # load plugins
source $HOME/.zsh/plugins.zsh # load plugins
source $HOME/.zsh/plugin-config-post.zsh # config plugins


# default settings (not plugin specific)
source $HOME/.zsh/defaults.zsh

# secret stuff (api keys, ...)
source $HOME/.zsh/secrets.zsh

# yubikey ssh agent
#export SSH_AUTH_SOCK="/opt/homebrew/var/run/yubikey-agent.sock"

## Zplug needs update?
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
#eval "$(chef shell-init zsh)"
