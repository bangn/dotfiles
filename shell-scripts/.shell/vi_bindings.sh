bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^k' kill-line
bindkey '^a' vi-beginning-of-line
bindkey '^e' end-of-line
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg[yellow]%} [% VI]%  %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
