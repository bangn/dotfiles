## Find my full .zshrc at <github.com/mislav/dotfiles/blob/master/zshrc>.

# setup

autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
setopt prompt_subst

HISTFILE=$HOME/.histfile
HISTSIZE=100000
SAVEHIST=10000000

setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt appendhistory autocd

# prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{${fg[blue]}%}@%{$reset_color%}%{${fg[green]}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{${fg[green]}%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{${fg[red]}%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# show git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

# show red star if there are uncommitted changes
parse_git_dirty() {
  if command git diff-index --quiet HEAD 2> /dev/null; then
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}

# if in a git repo, show dirty indicator + git branch
git_custom_status() {
  git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# put fancy stuff on the right
# RPS1='$(git_custom_status) $EPS1'

# basic prompt on the left
PROMPT='%{$fg[cyan]%}%(5~|%-1~/…/%3~|%4~)% $(git_custom_status)%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
