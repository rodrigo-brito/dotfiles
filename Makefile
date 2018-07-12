init:
	[ ! -f ~/.gitconfig ] && ln -s $(PWD)/.gitconfig ~/.gitconfig || echo "[GITCONFIG] SKIP" 
	[ ! -f ~/.zshrc ] && ln -s $(PWD)/.zshrc ~/.zshrc && source  ~/.zshrc || echo "[ZSHRC] SKIP"