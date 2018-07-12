# ----------------------
# Functions
# ----------------------

# Who is using the port
# Use: whoseport <port_number>
whoseport() {
    lsof -i ":$1" | grep LISTEN
}

# Docker container exec
# Use: dsh <container_id>
dsh() {
	docker exec -ti $1 bash 2>/dev/null || \
		docker exec -ti $1 sh
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
