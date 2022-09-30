# Shortcuts
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Github PR
alias pr="gh pr create --web"

# Neovim, not vim or vi
alias vim=nvim
alias vi=nvim

# get kube image for pod
function _k_img() {
  kubectl get pods -o name | grep $1  | xargs kubectl get -o yaml | grep image:
}

alias ls='ls --color=tty'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

# scale deployment
function _scale() {
  kubectl scale deployment $1 --replicas=$2
}
