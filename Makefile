git-install:
	ln -sf `pwd`/.gitconfig ~/.gitconfig

zsh-install:
	ln -sf `pwd`/.zshrc ~/.zshrc
	source  ~/.zshrc

vim-install:
	ln -sf `pwd`/.vimrc ~/.vimrc
	ln -sf `pwd`/.vimrc.local ~/.vimrc.local
	vim --noplugin +PlugInstall +qall

install: \
	git-install \
	zsh-install \
	vim-install
