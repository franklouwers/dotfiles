fpath=( "$HOME/.zsh/plugins" $fpath )

# have zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Async because fast
zplug "mafredri/zsh-async", from:"github"

# fzf plugin
zplug 'unixorn/fzf-zsh-plugin'
zplug 'chitoku-k/fzf-zsh-completions'

# enhance cd
zplug "b4b4r07/enhancd", use:init.sh

#autoload -Uz colors && colors

## following 3 need to be in this order!
# auto-suggestions
zplug 'zsh-users/zsh-autosuggestions'
# syntax-highlighting
#zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zdharma-continuum/fast-syntax-highlighting'
# better vi mode then bindkeys -v
zplug "jeffreytse/zsh-vi-mode"

zplug 'axieax/zsh-starship' # theme

# Then, source plugins and add commands to $PATH
zplug load

## non-zplug ones below

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

#  autoload -Uz compinit
#  compinit
fi
