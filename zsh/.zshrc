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

k8sDev () {
    KUBECONFIG=~/.kube/development.yaml "$*"
}

k8sMedRes () {
    KUBECONFIG=~/.kube/medical-research.yaml "$*"
}

k8sMedDev () {
    KUBECONFIG=~/.kube/medical-development.yaml "$*"
}

k8sCla () {
    KUBECONFIG=~/.kube/class2-live.yaml "$*"
}

k8sUat () {
    KUBECONFIG=~/.kube/uat.yaml "$*"
}

k8sBeta () {
    KUBECONFIG=~/.kube/beta.yaml "$*"
}

bk9 () {
    k8sBeta k9s
}

dk9 () {
    k8sDev k9s
}

mrk9 () {
    k8sMedRes k9s
}

mdk9 () {
    k8sMedDev k9s
}

ck9 () {
    k8sCla k9s
}

uk9 () {
    k8sUat k9s
}

npmtoken () {
    export NPM_TOKEN=$(op item  get buwpyelko73jbpqxkvmgz574au --fields password)
}
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
