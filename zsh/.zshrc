TMUX_CONFIG="~/.config/tmux/tmux.conf"
DEVELOPMENT_DIR=~/Development/XUND

setopt inc_append_history
cd $DEVELOPMENT_DIR

export TERM=alacritty

bindkey '^R' history-incremental-search-backward

export NVM_DIR="$HOME/.nvm"
. $(brew --prefix nvm)/nvm.sh
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"


alias					\
  tn="tmux -u -f $TMUX_CONFIG new"	\
  ta="tmux -u -f $TMUX_CONFIG attach"	\
  tt="nvim $TMUX_CONFIG"		\
  od="tmux new-window 'cd $DEVELOPMENT_DIR && nvim \$(ls . | fzf)'"

alias tf="terraform"

pinned () {
  open -a Google\ Meet
  echo https://meet.google.com/rka-kznq-nvv | pbcopy
}

xc () {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --profile-email=szabo@xund.ai $*
}

bc () {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --profile-email=burczeckley@gmail.com $*
}

board () {
  xc https://xund.atlassian.net/jira/software/c/projects/TEAM/boards/83
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

ls () {
    exa -lah "$*"
}

lg () {
    lazygit
}

getKubeconf () {
  exo compute sks kubeconfig $1 kubernetes-admin > ~/.kube/$1.yaml
}

k8sDev () {
    KUBECONFIG=~/.kube/development.yaml $*
}

k8sMedRes () {
    KUBECONFIG=~/.kube/medical-research.yaml $*
}

k8sMedDev () {
    KUBECONFIG=~/.kube/medical-development.yaml $*
}

k8sCla () {
    KUBECONFIG=~/.kube/class2-live.yaml $*
}

k8sUat () {
    KUBECONFIG=~/.kube/uat.yaml $*
}

k8sBeta () {
    KUBECONFIG=~/.kube/beta.yaml $*
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
export OP_ACCOUNT="xundsolutions.1password.com"
