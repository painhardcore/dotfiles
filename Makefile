
# default rule
default: install


# @ln -nfs ~/Documents/dotfiles/.vimrc ~/.vimrc
# @ln -nfs ~/Documents/dotfiles/.tmux.conf ~/.tmux.conf
.PHONY: install
install:
	
	@ln -nfs ~/Documents/dotfiles/.zshrc ~/.zshrc
	@ln -nfs ~/Documents/dotfiles/.gitconfig ~/.gitconfig

