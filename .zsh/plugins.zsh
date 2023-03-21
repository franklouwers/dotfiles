fpath=( "$HOME/.zsh/plugins" $fpath )

# Async because fast
zplug "mafredri/zsh-async", from:"github"

# fzf plugin
zplug 'unixorn/fzf-zsh-plugin'
zplug 'chitoku-k/fzf-zsh-completions'

# enhance cd
zplug "b4b4r07/enhancd", use:init.sh

autoload -Uz colors && colors

## following 3 need to be in this order!
# auto-suggestions
zplug 'zsh-users/zsh-autosuggestions'
# syntax-highlighting
#zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zdharma-continuum/fast-syntax-highlighting'
# better vi mode then bindkeys -v
zplug "jeffreytse/zsh-vi-mode"

zplug 'axieax/zsh-starship' # theme

# z for easy cd
. /opt/homebrew/etc/profile.d/z.sh


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

## non-zplug ones below

autoload -U compinit compdef
autoload -U promptinit; promptinit

# Kube-ps1 doesn't work properly with the zplug install procedures
#source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
#
# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
