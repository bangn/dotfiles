export_path() {
  if [[ ! "$PATH" == *"$1"* ]]; then
    export PATH="${PATH:+${PATH}:}$1"
  fi
}

PATHS="$HOME/.cabal/bin
$HOME/.cargo/bin
$HOME/.ghcup/bin
$HOME/.local/bin
$HOME/.talisman/bin
$HOME/Library/Haskell/bin
$HOME/dotfiles/tools/bin
/opt/ghc/bin
/usr/local/bin"

for p in $(echo "$PATHS" | sed 's/\n/ /g'); do
  export_path "$p"
done

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
source "$HOME/.asdf/completions/asdf.bash"

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
