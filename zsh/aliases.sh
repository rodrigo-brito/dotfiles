# ----------------------
# Aliases
# ----------------------

# General
# ----------------------
alias lah="ls -lah"

# Git
# ----------------------
alias gru="git remote update"

# Docker / Kubernetes
# ----------------------
# bash exec with fuzzy finder
alias k="kubectl"
alias kubesh='pod=$(kubectl get pods | cut -f1 -d" " | fzf); kubectl exec -ti $pod bash || kubectl exec -ti $pod sh'
