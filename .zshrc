# zsh

export TERM="xterm-256color"

autoload -U colors && colors
autoload -Uz vcs_info

setopt prompt_subst

zstyle ':vcs_info:*' stagedstr '%F{green} ●%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow} ●%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[ %F{green}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{grey}[ %F{green}%b%F{5}%F{2}%c%F{3}%u%f%F{red}%m %F{grey}] '
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-st git-stash
zstyle ':vcs_info:*' enable git

local ret_status="%(?:%F{green}➜ :%F{red}➜ )"

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
  hook_com[unstaged]+='%F{red} ...%f'
fi
}

function +vi-git-st() {
    local ahead behind
    local -a gitstatus

    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
    (( $ahead )) && gitstatus+=( "+${ahead}" )

    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
    (( $behind )) && gitstatus+=( "-${behind}" )

    gitstatus=${(j:/:)gitstatus// /}
    (( $gitstatus )) && hook_com[misc]+=" ${gitstatus}"

    test -n "${hook_com[misc]}" && hook_com[misc]=" ${(j:/:)hook_com[misc]// /}"
}

function +vi-git-stash() {
    local -a stashes

    if [[ -s $(git rev-parse --git-dir)/refs/stash ]] ; then
        stashes=$(git stash list 2>/dev/null | wc -l | sed 's/^ *//')
        hook_com[misc]+=" [${stashes} stashed]"
    fi
}

precmd () { vcs_info }

PROMPT='${ret_status} %{$fg[cyan]%}%~%{$reset_color%} ${vcs_info_msg_0_} '

if [ -d $HOME/.dotfiles ]; then
  for file in $HOME/.dotfiles/*.zsh; do
    source $file
  done
fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
