# Z shell (zsh) dotfiles

Collection of dotfiles for `zsh` that I use on my local development machines. I have switched moved away from oh-my-zsh and prezto mainly because I felt it was overly bloated for what I used it for.

## Dependencies

Dependency on homebrew and the following list of packages;

### Homebrew

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Packages

```
brew install zsh zsh-completions zsh-syntax-highlighting stow pinentry-mac openssl gpg-agent gpg
```

The rest of the packages below are also useful;

```
awscli
coreutils
fontconfig
tig
tmux
tree
```

## Configuration

Set zsh as your default shell:

```
chsh -s $(which zsh)
```

## Installation

```
git clone git@github.com:ldejager/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow zsh
stow git
stow gnupg
stow vim

source ~/.zshrc
```
