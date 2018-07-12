# ----------------------
# Aliases
# ----------------------

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