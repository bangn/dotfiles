export_path() {
  if [[ ! "$PATH" == *"$1"* ]]; then
    export PATH="$1:${PATH}"
  fi
}

################################################################################
# Use nord for terminal color
################################################################################
if [[ uname == "Linux" ]]; then
  test "$HOME/dircolors.nord" && eval $(dircolors "$HOME/dircolors.nord")
fi

################################################################################
# nix
################################################################################
# Source nix package manager and fix perl locale warning
if [[ ! "$PATH" == *$HOME/.nix-profile/bin* ]]; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

################################################################################
# Add Golang path
################################################################################
export ASDFROOT=$HOME/.asdf
export ASDFINSTALLS=$HOME/.asdf/installs
export GOPATH="$HOME/src/golang"
GOVERSION=$(asdf current golang | sed 's/\s*(set by .*)//g' | awk '{print $2}')
export GOROOT=$ASDFINSTALLS/golang/$GOVERSION/go/
export_path "$GOPATH/bin"
export GOROOT_BOOTSTRAP=$GOROOT

################################################################################
# homebrew
################################################################################
export_path "/opt/homebrew/bin"
export_path "/opt/homebrew/sbin"

################################################################################
# llvm
################################################################################
export_path "/opt/homebrew/opt/llvm@12/bin"
