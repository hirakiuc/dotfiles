.DEFAULT_GOAL := setup

deps:
	# Install dein.nvim
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./install.sh ~/.vim/cache/dein

setup:
	./bin/renew

.PHONY: deps setup
