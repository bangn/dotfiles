#! /bin/bash
# shellcheck disable=SC1090
# shellcheck disable=SC2164

fpath=($HOME/zsh-completions/src $HOME/completions $fpath)
rm -f "$HOME/.zcompdump"

autoload -Uz compinit
compinit

zstyle :compinstall filename "$HOME/.zshrc"

zstyle ':completion:*' menu select=0

source "$HOME/completions/_tmuxinator"
source "$HOME/completions/_exercism"

# cd to projects
cdp() {
  cd "$HOME/dev/projects/$1"
}

# cd to ruby projects
cdr() {
  cd "$HOME/dev/projects/ruby/$1"
}

# cd to elixir projects
cde() {
  cd "$HOME/dev/projects/elixir/$1"
}

# cd to study projects
cds() {
  cd "$HOME/study/$1"
}

# cd to gems
cdg() {
  cd "$GEM_HOME/gems/$1"
}

# cd to kowainik projects
cdk() {
  cd "$HOME/dev/projects/kowainik/$1"
}
