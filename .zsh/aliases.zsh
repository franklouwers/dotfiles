# Shortcuts
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Github PR
alias pr="gh pr create --web"
alias openprs="gh pr list"

# Neovim, not vim or vi
alias vim=nvim
alias vi=nvim

alias k=kubectl

# get kube image for pod
function k_img() {
  kubectl get pods -o name | grep $1  | xargs kubectl get -o yaml | grep image:
}

alias ls='ls --color=tty'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

# scale deployment
function scale() {
  kubectl scale deployment $1 --replicas=$2
}
function scalests() {
  kubectl scale sts $1 --replicas=$2
}

# neovim for vimdiff
alias vimdiff='nvim -d'

alias kubenodes="kubectl get nodes -o custom-columns=NAME:'{.metadata.name}',ZONE:'{metadata.labels.topology\.kubernetes\.io/zone}',TYPE:'{metadata.labels.beta\.kubernetes\.io/instance-type}',ARCH:'{.metadata.labels.beta\.kubernetes\.io/arch}',CAPACITY_aws:'{.metadata.labels.eks\.amazonaws\.com/capacityType}',CAPACITY_karp:'{.metadata.labels.karpenter\.sh/capacity-type}',NODEID:'{.metadata.annotations.csi\.volume\.kubernetes\.io/nodeid}'"

alias jaws="ssh -D 1080 -q -N jumpbox-aws.krane-labs.io"
alias awslogin="aws sso login --profile administrator-access-kranelabs-identity"
alias awsurl="open ~/Desktop/aws.html"

alias sshpass="ssh -o PubkeyAuthentication=no"

function jwtcheck() {
  kubectl get secret -o json jwt.$1.cicd | jq -r '.data."access.jwt"' | base64 -D | jwt decode -j -  | jq '.payload."https://api.oqton.ai/claims"'
}

alias allow_unnotarized="xattr -r -d com.apple.quarantine"

function gitclean() {
  git branch --sort=-committerdate --format='%(refname:short)' | while IFS= read -r branch; do
  if [[ -z $(git log -1 --since='7 days ago' -s "$branch") ]]; then
    git branch -D "$branch"
  fi
done
}

alias kubecheck="kubectl df-pv; pluto detect-helm -owide -v2; kubectl version"

function terminfoghostty() {
  infocmp -x | ssh $1 -- tic -x -
}
