# ----------------------
# ZSH Settings - Updated at 28/01/2018
# ----------------------

# Base Settings
source ~/dotfiles/zsh/variables.sh
source ~/dotfiles/zsh/aliases.sh
source ~/dotfiles/zsh/functions.sh

# Oh My ZSH - https://github.com/robbyrussell/oh-my-zsh
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Themes
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Default user - Remove from prompt
DEFAULT_USER=$USER

# Plugins
# WD - https://github.com/mfaerevaag/wd
plugins=(git wd)

# Fuzzy search - https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autojumpt - https://github.com/wting/autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh