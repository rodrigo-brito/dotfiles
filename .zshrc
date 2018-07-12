# ----------------------
# ZSH Settings - Updated at 28/01/2018
# ----------------------

# Base Settings
source ~/dotfiles/zsh/variables.sh
source ~/dotfiles/zsh/aliases.sh
source ~/dotfiles/zsh/functions.sh

# Themes
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Default user - Remove from prompt
DEFAULT_USER=$USER

# Plugins
plugins=(git wd kubectl)

# Oh My ZSH - https://github.com/robbyrussell/oh-my-zsh
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Fuzzy search - https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autojumpt - https://github.com/wting/autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
[ -f /usr/local/etc/profile.d/autojump.sh ] && source /usr/local/etc/profile.d/autojump.sh

# Autosugestion
[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Local settings
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Kubernetes
if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi
