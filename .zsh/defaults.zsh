# Editors
export VISUAL=nvim
export EDITOR=nvim

# PATH/CPPFLAGS for java
export PATH="$PATH:/opt/homebrew/opt/openjdk/bin"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# add bin to path and krew stuff
export PATH="$HOME/bin:${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Use new gke auth mech
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Share history
setopt share_history

# colorize less (also see lesspipe)
export LESS="-R"

# use fzf-lessopen
#export LESSOPEN="|/opt/homebrew/bin/lesspipe.sh %s" # regular lessopen
export LESSOPEN="| lessfilter-fzf %s"

# GO envvars
export GOROOT=$(go env GOROOT)
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$(go env GOPATH)/bin"

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# because iterm2 has silly defaults (and apple as well)
ulimit -n 987654
