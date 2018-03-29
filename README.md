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
brew install awscli coreutils fontconfig tig tmux tree
```

## Configuration

Add the homebrew zsh version to `/etc/shells`

```
sudo dscl localhost -create /Local/Default/Users/${USER} UserShell /usr/local/bin/zsh
```

Set zsh as your default shell:

```
sudo dscl localhost -change /Local/Default/Users/${USER} UserShell /bin/ksh $(which zsh)
```

## Installation

```
git clone git@github.com:ldejager/dotfiles.git ~/dotfiles
cd ~/dotfiles
make install

source ~/.zshrc
```
