default:
	@echo "linux-deps"
	@echo "git-setup"
	@echo "terminal-setup"
	@echo "vim-setup"
	@echo "vscode-setup"
	@echo "tools-setup"
	@echo "linux-deps"
	@echo "docker-setup"

links-setup:
	ln -sf `pwd`/.zshrc ~/.zshrc
	ln -sf `pwd`/.gitconfig ~/.gitconfig
	ln -sf `pwd`/.gitignore_global ~/.gitignore_global

terminal-setup:
	@echo "--- ZSH Setup --"
	chsh -s $(which zsh)
	touch ~/.zshrc.local
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	
	@echo "--- ZSH Plugins / Utilities --"
	@if [ ! -d ~/.zsh/zsh-autosuggestions ]; then \
		@git clone git://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
	fi

	@echo "-- Termiantor --"
	ln -sf `pwd`/terminator/config ~/.config/terminator/config

vim-setup:
	@echo "--- Vim Setup --"
	ln -sf `pwd`/.vimrc ~/.vimrc
	ln -sf `pwd`/.vimrc.local ~/.vimrc.local
	vim --noplugin +PlugInstall +qall

vscode-setup:
	@echo "--- VS Code Setup --"
	ln -sf `pwd`/vscode/settings.json ~/.config/Code/User/settings.json

tools-setup:
	@echo "--- Tools Setup --"
	@git clone --depth 1 git://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

linux-deps:
	@echo "--- Linux Dependencies --"
	sudo apt update && sudo apt install -y \
		build-essential \
		curl \
		nodejs \
		zsh \
		vim \
		fonts-powerline \
		htop \
		autokey-gtk \
		python2-minimal \
		silversearcher-ag \
		autojump \
		terminator \
		chrome-gnome-shell \
		fonts-firacode

	# Python link for Ubuntu
	sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 2
	sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 3

go-update:
	@curl --silent https://golang.org/dl/ 2>&1 |\
		ag -o '/go([0-9.]+).linux-amd64.tar.gz' |\
		head -n 1 |\
		xargs -I@ sh -c 'curl -O https://dl.google.com/go@; echo @ | ag -o "(go[0-9\.]+.+)" | xargs -I % sh -c "sudo tar -C /usr/local -xzf % && rm %"'

docker-setup:
	sh -c "$$(curl -fsSL https://get.docker.com)"
	sudo groupadd docker
	sudo usermod -aG docker ${USER}

install: \
	linux-deps \
	git-setup \
	terminal-setup \
	vim-setup \
	vscode-setup \
	links-setup \
	tools-setup \
	docker-setup \
	go-update \

	@echo "Done!"
