# ----------------------
# Functions
# ----------------------

# Who is using the port
# Use: whoseport <port_number>
whoseport() {
    lsof -i ":$1" | grep LISTEN
}

# Docker container exec with fuzzy finder
dsh() {
    local CNT=$1
    if [ -z $CNT ]; then
        CNT=$(docker ps --format '{{.Names}}' | fzf);
    fi
    docker exec -ti $CNT bash 2>/dev/null || docker exec -ti $CNT sh
}

# Docker container log with fuzzy finder
dlog() {
    local CNT=$1
    if [ -z $CNT ]; then
        CNT=$(docker ps --format '{{.Names}}' | fzf);
    fi
    docker logs --tail=100 -f $CNT
}

# Golang Debugger - https://github.com/y0ssar1an/q
qq() {
    clear

    logpath="$TMPDIR/q"
    if [[ -z "$TMPDIR" ]]; then
        logpath="/tmp/q"
    fi

    if [[ ! -f "$logpath" ]]; then
        echo 'Q LOG' > "$logpath"
    fi

    tail -100f -- "$logpath"
}

rmqq() {
    if [[ -f "$TMPDIR/q" ]]; then
        rm "$TMPDIR/q"
    fi
    qq
}

# Fetch a git pull request
# Usage: gpr origin 666
fpr() {
    git fetch $1 "pull/$2/head:pull-$2" && git co "pull-$2"
}

# Dot files reload
dfr() {
    echo "reloading..."
    source ~/.zshrc
}

# Change Kubernetes namespace
kns() {
    namespace=$1
    if [ -z $namespace ]; then
        echo "Please, provide the namespace name: 'change-ns mywebapp'"
        return 1
    fi

    kubectl config set-context $(kubectl config current-context) --namespace $namespace
}

# Open a diff comparation between two urls
diffjson() {
    if [ -z $1 ] || [ -z $2 ]; then
        echo "Please, provide two urls"
        return 1
    fi

    curl -s "$1" | jq '.' > /tmp/1.json
    curl -s "$2" | jq '.' > /tmp/2.json

    # https://github.com/blazecolour/gendiff-cli
    gendiff /tmp/1.json /tmp/2.json
}

# Decode a base64 string
# Usage: d64 SGlnaGxpZ2h0OjQyMzI=
d64() {
    echo "$1" | base64 -d
}