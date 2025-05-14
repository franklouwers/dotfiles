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
export HISTSIZE=100000
export HISTFILESIZE=100000
export SAVEHIST=100000

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

# because apple macos has silly defaults buts Terminal cheats
ulimit -n 987654

# Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

# defaults for wtfis. Be careful with -g, as greynoise has a low default api limit
export WTFIS_DEFAULTS="-a -u"
