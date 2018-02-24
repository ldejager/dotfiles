DOTFILES := $(wildcard  ~/.dotfiles)

.PHONY: install setup all

default: all

install:
	@echo '=> Installing required packages.'
	@/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@brew install zsh zsh-completions zsh-syntax-highlighting stow pinentry-mac openssl gpg-agent gpg
	@if [ ! -d $(DOTFILES) ]; then \
	  echo "=> Cloning into ~/.dotfiles..."; \
		@git clone --recurse-submodules -j8 git@github.com:ldejager/dotfiles.git ~/.dotfiles; \
		@git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k; \
	fi

setup:
	@echo '=> Deploying .dotfiles...'
	@stow -d $(DOTFILES) zsh

all: install setup
