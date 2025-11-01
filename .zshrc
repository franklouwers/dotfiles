# ZComet

# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# prompt
zcomet load romkatv/powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  zcomet snippet "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || zcomet snippet ~/.p10k.zsh

# asdf
#zcomet snippet /opt/homebrew/opt/asdf/libexec/asdf.sh

# aliases
zcomet snippet $HOME/.zsh/aliases.zsh

#### PLUGINS ########
# cache eval things
zcomet load mroth/evalcache

# FZF
zcomet load 'unixorn/fzf-zsh-plugin'
zcomet load 'chitoku-k/fzf-zsh-completions'

# extra completions are here
zcomet fpath $HOME/.zsh/plugins

## following 3 need to be in this order!
# auto-suggestions
zcomet load 'zsh-users/zsh-autosuggestions'
# syntax-highlighting
#zcomet load 'zsh-users/zsh-syntax-highlighting'
zcomet load 'zdharma-continuum/fast-syntax-highlighting'
# better vi mode then bindkeys -v
zcomet load "jeffreytse/zsh-vi-mode"

zcomet snippet $HOME/.zsh/plugin-config-post.zsh # config plugins

# default settings (not plugin specific)
zcomet snippet $HOME/.zsh/defaults.zsh

# secret stuff (api keys, ...)
zcomet snippet $HOME/.zsh/secrets.zsh

# orbstack
#zcomet snippet $HOME/.orbstack/shell/init.zsh

# yubikey ssh agent
#export SSH_AUTH_SOCK="/opt/homebrew/var/run/yubikey-agent.sock"

# Run compinit and compile its cache
zcomet compinit

# hooks
_evalcache /opt/homebrew/bin/brew shellenv
_evalcache zoxide init zsh

# krew path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
