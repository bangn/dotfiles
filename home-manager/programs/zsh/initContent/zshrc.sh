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
# Multi-user installs (darwin) use nix-daemon.sh; single-user (linux) uses nix.sh
if [[ ! "$PATH" == *$HOME/.nix-profile/bin* ]]; then
  if [[ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  elif [[ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]]; then
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"
  fi
fi

################################################################################
# homebrew
################################################################################
export_path "/opt/homebrew/bin"
export_path "/opt/homebrew/sbin"

################################################################################
# llvm
################################################################################
# export_path "/opt/homebrew/opt/llvm@12/bin"

################################################################################
# basictex
################################################################################
export_path "/Library/TeX/texbin/"
