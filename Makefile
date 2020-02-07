
# default rule
default: install



.PHONY: install
install:
	@ln -nfs ~/dotfiles/.vimrc ~/.vimrc
	@ln -nfs ~/dotfiles/.tmux.conf ~/.tmux.conf
	@ln -nfs ~/dotfiles/.zshrc ~/.zshrc

