git-install:
	ln -sf `pwd`/.gitconfig ~/.gitconfig

zsh-install:
	ln -sf `pwd`/.zshrc ~/.zshrc
	source  ~/.zshrc

vim-install:
	ln -sf pwd`/.vimrc ~/.vimrc
	vim --noplugin +PlugInstall +qall

install: \
	git-install \
	zsh-install \
	vim-install
