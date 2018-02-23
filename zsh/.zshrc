ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"

HIST_STAMPS="dd.mm.yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMP_ON_NEWLINET=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="↳ "

setopt PROMPT_CR
setopt PROMPT_SP

# GPG

if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf)
fi

# Aliases

alias reload="exec $SHELL -l"
alias ll="ls -al"

# Exports

export TERM="xterm-256color"
export PROMPT_EOL_MARK=""
export EDITOR="vim"
export GOPATH=~/workspace/development/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.composer/vendor/bin
export PATH=/usr/local/bin:$PATH
export HOMEBREW_NO_ANALYTICS=1
export GPG_TTY=$(tty)

# History

if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=1000000
SAVEHIST=1000000

alias history='fc -El 1'

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
