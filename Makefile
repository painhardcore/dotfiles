
# default rule
default: install


# install rule
.PHONY: install
install:
	@ln -nfs ~/dotfiles/.vimrc ~/.vimrc
	@ln -nfs ~/dotfiles/.tmux.conf ~/.tmux.conf
	@ln -nfs ~/dotfiles/.zshrc ~/.zshrc

