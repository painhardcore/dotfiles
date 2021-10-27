
# default rule
default: install



.PHONY: install
install:
	@ln -nfs ~/Documents/dotfiles/.vimrc ~/.vimrc
	@ln -nfs ~/Documents/dotfiles/.tmux.conf ~/.tmux.conf
	@ln -nfs ~/Documents/dotfiles/.zshrc ~/.zshrc

