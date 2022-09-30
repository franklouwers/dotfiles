# Editors
export VISUAL=nvim
export EDITOR=nvim

# PATH/CPPFLAGS for java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# add bin to path
export PATH="$HOME/bin:$PATH"

# Use new gke auth mech
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
