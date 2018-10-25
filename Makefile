git-install:
	ln -sf `pwd`/.gitconfig ~/.gitconfig
	ln -sf `pwd`/.gitignore_global ~/.gitignore_global

zsh-install:
	ln -sf `pwd`/.zshrc ~/.zshrc

vim-install:
	ln -sf `pwd`/.vimrc ~/.vimrc
	ln -sf `pwd`/.vimrc.local ~/.vimrc.local
	vim --noplugin +PlugInstall +qall

vscode-linux:
	ln -sf `pwd`/vscode/settings.json ~/.config/Code/User/settings.json

install-linux-softwares:
	sudo apt install -y build-essential \
		git \
		nodejs \
		zsh \
		vim \
		fonts-powerline \
		ruby-full

install: \
	git-install \
	zsh-install \
	vim-install
