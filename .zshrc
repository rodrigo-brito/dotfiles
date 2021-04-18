# ----------------------
# ZSH Settings
# ----------------------

# Base Settings
source ~/dotfiles/zsh/variables.sh
source ~/dotfiles/zsh/aliases.sh
source ~/dotfiles/zsh/functions.sh

HISTSIZE=10000
HISTFILESIZE=2000

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

# Autojump - https://github.com/wting/autojump
[[ -s /home/rodrigo/.autojump/etc/profile.d/autojump.sh ]] && source /home/rodrigo/.autojump/etc/profile.d/autojump.sh

# Autosugestion
[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Local settings
[ -f ~/.zshrc.local ] && source ~/.zshrc.local