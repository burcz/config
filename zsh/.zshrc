TMUX_CONFIG="~/.config/tmux/tmux.conf"
DEVELOPMENT_DIR=~/Development/XUND

setopt inc_append_history

export TERM=alacritty

#bindkey '^R' history-incremental-search-backward

source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export NVM_DIR="$HOME/.nvm"
. $(brew --prefix nvm)/nvm.sh
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"


alias					\
  tn="tmux -u -f $TMUX_CONFIG new"	\
  ta="tmux -u -f $TMUX_CONFIG attach"	\
  tt="nvim $TMUX_CONFIG"		\
  od="cd $DEVELOPMENT_DIR && nvim \$(ls . | fzf)"

alias tf="terraform"
alias kc="kubectl"

pinned () {
  open -a Google\ Meet
  echo https://meet.google.com/rka-kznq-nvv | pbcopy
}

k () {
  xauthzconnect -u szabo@xund.ai -b -k $1
}

xc () {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --profile-email=szabo@xund.ai $*
}

bc () {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --profile-email=burczeckley@gmail.com $*
}

board () {
  xc https://xund.atlassian.net/jira/software/c/projects/MR/boards/96
}

getSecret () {
  op item get $1 --vault ${2}-cluster-secrets --fields notesPlain | sed  's/\"//g'
}

sealSecret () {
  case $2 in
  u)
    VAULT="uat"
    CONFIG="config-uat"
    ENVIRONMENT="uat"
    ;;
  b)
    VAULT="beta"
    CONFIG="config-beta"
    ENVIRONMENT="beta"
    ;;
  mr)
    VAULT="medical-research"
    CONFIG="config-medres"
    ENVIRONMENT="medical-research"
    ;;
  c)
    VAULT="class2"
    CONFIG="config-class2"
    ENVIRONMENT="class2-live"
    ;;
  d)
    VAULT="development"
    CONFIG="config-dev"
    ENVIRONMENT="development"
    ;;
  *)
    VAULT="development"
    CONFIG="config-dev"
    ENVIRONMENT="development"
    ;;
  esac
  getSecret $1 $VAULT > ~/tmp/kustomization.yaml

  cat <<EOF >> ~/tmp/kustomization.yaml
generatorOptions:
  disableNameSuffixHash: true
EOF

  kustomize build ~/tmp | KUBECONFIG=~/.kube/$CONFIG kubeseal --format yaml >~/Development/XUND/xund-k8s/environments/$ENVIRONMENT/resources/secrets/$1.yaml
  rm ~/tmp/kustomization.yaml
}

ez () {
  nvim ~/.zshrc
}

sc () {
  source ~/.zshrc
}

xcx () {
  case $2 in
  u)
    ENVIRONMENT="uat"
    ;;
  b)
    ENVIRONMENT="beta"
    ;;
  mr)
    ENVIRONMENT="medicalresearch"
    ;;
  c)
    ENVIRONMENT="class2"
    ;;
  d)
    ENVIRONMENT="development"
    ;;
  md)
    ENVIRONMENT="medicaldevelopment"
    ;;
  md)
    ENVIRONMENT="medicaldevelopment"
    ;;
  *)
    ENVIRONMENT="development"
    ;;
  esac
  xc https://$1.$ENVIRONMENT.xund.solutions
}

genpass () {
     op item edit $(op item list | grep 'retrievable generated password' | awk '/\w/{print$1}') --generate-password="$*",letters,digits >/dev/null && op read op://Private/'retrievable generated password'/password
}

wtr () {
    curl wttr.in/$*
}

wtrk () {
    curl wttr.in/kecskemet
}

wtrb () {
    curl wttr.in/budapest
}

dkak () {
  k8sDev kak $*
}

dkaf () {
  k8sDev kaf $*
}

bkak () {
  k8sBeta kak $*
}

bkaf () {
  k8sBeta kaf $*
}

ckak () {
  k8sCla kak $*
}

ckaf () {
  k8sCla kaf $*
}

ukak () {
  k8sUat kak $*
}

ukaf () {
  k8sUat kaf $*
}

mrkak () {
  k8sMedRes kak $*
}

mrkaf () {
  k8sMedRes kaf $*
}

kak () {
    kubectl kustomize --enable-helm "$*" | kubectl apply -f -
}

chtsh () {
    ~/bin/cht.sh "$*"
}

pis () {
    kubectl kustomize --enable-helm "$*" | kubectl delete -f -
}

kaf () {
    kubectl apply -f "$*"
}

lse () {
    exa -lah "$*"
}

lg () {
    lazygit
}

getKubeconf () {
  exo compute sks kubeconfig $1 kubernetes-admin > ~/.kube/$1.yaml
}

k8sDev () {
    #KUBECONFIG=~/.kube/development.yaml $*
    KUBECONFIG=~/.kube/config-dev $*
}

k8sMedRes () {
    KUBECONFIG=~/.kube/config-medres $*
}

k8sMedDev () {
    KUBECONFIG=~/.kube/medical-development.yaml $*
}

k8sCla () {
    KUBECONFIG=~/.kube/config-class2 $*
}

k8sUat () {
    #KUBECONFIG=~/.kube/uat.yaml $*
    KUBECONFIG=~/.kube/config-uat $*
}

k8sBeta () {
    KUBECONFIG=~/.kube/config-beta $*
}

bk () {
    k8sBeta kubectl $*
}

bk9 () {
    k8sBeta k9s
}

dk () {
    k8sDev kubectl $*
}

dk9 () {
    k8sDev k9s
}

mrk () {
    k8sMedRes kubectl $*
}

mrk9 () {
    k8sMedRes k9s
}

mdk () {
    k8sMedDev kubectl $*
}

mdk9 () {
    k8sMedDev k9s
}

ck () {
    k8sCla kubectl $*
}

ck9 () {
    k8sCla k9s
}

uk () {
    k8sUat kubectl $*
}

uk9 () {
    k8sUat k9s
}

npmtoken () {
    export NPM_TOKEN=$(op item  get buwpyelko73jbpqxkvmgz574au --fields password)
}
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/Users/szabo/.cargo/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# BEGIN SNIPPET: OVHcloud Web PaaS CLI configuration
HOME=${HOME:-'/Users/szabo'}
export PATH="$HOME/"'.webpaas-cli/bin':"$PATH"
if [ -f "$HOME/"'.webpaas-cli/shell-config.rc' ]; then . "$HOME/"'.webpaas-cli/shell-config.rc'; fi # END SNIPPET

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/szabo/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/szabo/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/szabo/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/szabo/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Created by `pipx` on 2024-05-27 09:00:14
export PATH="$PATH:/Users/szabo/.local/bin"
export OP_ACCOUNT="xundsolutions.1password.com"
