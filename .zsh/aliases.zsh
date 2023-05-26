# Shortcuts
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Github PR
alias pr="gh pr create --web"

# Neovim, not vim or vi
alias vim=nvim
alias vi=nvim

alias k=kubectl
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

# neovim for vimdiff
alias vimdiff='neovim -d'

function license_finder() {
  command license_finder $* --decisions-file=.licensefinder/dependency_decisions.yml
}

alias tflock='terraform providers lock -platform=darwin_arm64; terraform providers lock -platform=darwin_amd64; terraform providers lock -platform=linux_amd64'

alias kubenodes="kubectl get nodes -o custom-columns=NAME:'{.metadata.name}',REGION:'{.metadata.labels.topology\.kubernetes\.io/region}',ZONE:'{metadata.labels.topology\.kubernetes\.io/zone}'"
