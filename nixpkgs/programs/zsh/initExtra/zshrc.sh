export_path() {
  if [[ ! "$PATH" == *"$1"* ]]; then
    export PATH="${PATH:+${PATH}:}$1"
  fi
}

################################################################################
# Use nord for terminal color
################################################################################
if [[ $(uname) == "Linux" ]]; then
  test "$HOME/dircolors.nord" && eval $(dircolors "$HOME/dircolors.nord")
else
  test "$HOME/dircolors.nord" && eval $(gdircolors "$HOME/dircolors.nord")
fi

################################################################################
# nix
################################################################################
# Source nix package manager and fix perl locale warning
if [[ ! "$PATH" == *$HOME/.nix-profile/bin* ]]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

################################################################################
# asdf
################################################################################
source "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

################################################################################
# Add Golang path
################################################################################
export ASDFROOT=$HOME/.asdf
export ASDFINSTALLS=$HOME/.asdf/installs
export GOPATH="$HOME/src/golang"
GOV=$(asdf current golang | sed 's/\s*(set by .*)//g')
export GOROOT=$ASDFINSTALLS/golang/$GOV/go/
export_path "$GOPATH/bin"
export GOROOT_BOOTSTRAP=$GOROOT

################################################################################
# fzf
################################################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source autojump
if [[ "$(uname)" == "Darwin" ]]; then
  source "/usr/local/share/autojump/autojump.zsh"
else
  source /usr/share/autojump/autojump.zsh
fi
