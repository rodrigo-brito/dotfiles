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
    local gpath="${GOPATH:-$HOME/go}"
    "${gpath%%:*}/src/github.com/y0ssar1an/q/q.sh" "$@"
}
rmqq() {
    if [[ -f "/tmp/q" ]]; then
        rm "/tmp/q"
    fi
    qq
}
