bindkey '^ ' autosuggest-accept
bindkey '^?' backward-delete-char
bindkey '^a' vi-beginning-of-line
bindkey '^e' end-of-line
bindkey '^h' backward-delete-char
bindkey '^k' kill-line
bindkey '^N' down-history
bindkey '^P' up-history
bindkey '^r' history-incremental-search-backward
bindkey '^w' backward-kill-word
bindkey \^\[\^\[\[C emacs-forward-word
bindkey \^\[\^\[\[D emacs-backward-word
bindkey \^U backward-kill-line

function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg[yellow]%} [% VI]%  %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
