# ----------------------
# ZSH Settings
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

# Autojump - https://github.com/wting/autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# Autosugestion
[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Local settings
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/rodrigo/softwares/google-cloud-sdk/path.zsh.inc' ]; then . '/home/rodrigo/softwares/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/rodrigo/softwares/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/rodrigo/softwares/google-cloud-sdk/completion.zsh.inc'; fi
