# ----------------------
# Aliases
# ----------------------

# General
# ----------------------
alias lah="ls -lah"
alias clear="printf '\033[2J\033[3J\033[1;1H'"


# Git
# ----------------------
alias gru="git remote update"
alias gbf='git checkout $(git branch --sort=-committerdate | fzf)'
alias gsf="git diff-tree --no-commit-id --name-only -r"
alias ghpr='gh pr list | fzf | awk "{print \$1}" | xargs -I @ gh pr checkout @'

# Docker / Kubernetes
# ----------------------
# bash exec with fuzzy finder
alias k="kubectl"
alias kubesh='pod=$(kubectl get pods | cut -f1 -d" " | fzf); kubectl exec -ti $pod bash || kubectl exec -ti $pod sh'
alias kuc='kubectl config use-context'
