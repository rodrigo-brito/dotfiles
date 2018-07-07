# ----------------------
# ZSH Settings - Updated at 28/01/2018
# ----------------------

# Oh My ZSH - https://github.com/robbyrussell/oh-my-zsh
export ZSH=/home/rodrigo/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Themes
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Default user - Remove from prompt
DEFAULT_USER=$USER

# Plugins
# WD - https://github.com/mfaerevaag/wd
plugins=(git wd)

# GO ENV
export GOROOT=/usr/local/go
export GOPATH=$HOME/development/go

# Custom bin and vendor folder - /home/rodrigo/vendor
export PATH=$PATH:/home/rodrigo/vendor/phantonJS:/home/rodrigo/.cargo/bin:/home/rodrigo/vendor/mozila-driver

# Fuzzy search - https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autojumpt - https://github.com/wting/autojump
[[ -s /home/rodrigo/.autojump/etc/profile.d/autojump.sh ]] && source /home/rodrigo/.autojump/etc/profile.d/autojump.sh

# GVM Env
# [[ -s "/home/rodrigo/.gvm/scripts/gvm" ]] && source "/home/rodrigo/.gvm/scripts/gvm"

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