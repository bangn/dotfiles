function export_path() {
  if [[ ! "$PATH" == *"$1"* ]]; then
    export PATH="${PATH:+${PATH}:}$1"
  fi
}

local PATHS="$HOME/.cabal/bin
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
# ENV vars
################################################################################
export EDITOR='nvim'
export VISUAL='nvim'
export SUDO_ASKPASS='/usr/bin/ssh-askpass'
########################################
# For postgres
########################################
export PGUSER='postgres'
export PGHOST='localhost'

################################################################################
# Use nvim/vim to open man page.
################################################################################
case $EDITOR in
    nvim) export MANPAGER="nvim +'set ft=man' -" ;;
     vim) export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\"" ;;
       *) export MANPAGER='less' ;;
esac

################################################################################
# Use nord for terminal color
################################################################################
if [[ $(uname) == "Linux" ]]; then
  test "$HOME/dircolors.nord" && eval $(dircolors "$HOME/dircolors.nord")
else
  test "$HOME/dircolors.nord" && eval $(gdircolors "$HOME/dircolors.nord")
fi

################################################################################
# Added by the Heroku Toolbelt
################################################################################
export_path "/usr/local/heroku/bin"

################################################################################
# nix
################################################################################
# Source nix package manager and fix perl locale warning
if [[ ! "$PATH" == *$HOME/.nix-profile/bin* ]]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi
# Fix nix setlocale problems
# https://qiita.com/kimagure/items/4449ceb0bda5c10ca50f
if [[ -z "$LOCALE_ARCHIVE_2_27" && ! "$(uname)" == "Darwin" ]]; then
  glibcLocales=$(nix-build --no-out-link "<nixpkgs>" -A glibcLocales)
  export LOCALE_ARCHIVE_2_27="${glibcLocales}/lib/locale/locale-archive"
fi
export LOCALE_ARCHIVE="$(readlink ~/.nix-profile/lib/locale)/locale-archive"

# home-manager
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

################################################################################
# Source all of the .sh files in $HOME/.shell
################################################################################
for file in $HOME/.shell/*; do
  source $file
done

################################################################################
# asdf
################################################################################
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

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
# Updates PATH for the Google Cloud SDK.
################################################################################
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc";
fi

if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc";
fi

################################################################################
# fzf
################################################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Setting fd as the default source for fzf
# fzf find hidden files.
export FZF_DEFAULT_COMMAND='fd --type f --ignore-case --hidden --exclude .git --exclude deps --exclude _build'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

################################################################################
# Change output of `time` command format(make it same as bash output).
################################################################################
export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

################################################################################
# direnv
################################################################################
if [[ ! -z $(which direnv) ]]; then
  eval "$(direnv hook zsh)"
fi

################################################################################
# Added by travis gem
################################################################################
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

################################################################################
# zplug
################################################################################
source ~/.zplug/init.zsh

zplug "wfxr/forgit"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

########################################
# zsh autosuggestions
########################################
bindkey '^ ' autosuggest-accept
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59' # Make suggestion more visible with solarized dark.

########################################
# forgit
########################################
forgit_add=gadd
forgit_diff=gdiff
forgit_restore=grestore

if ! zplug check --verbose; then
  zplug clean && zplug install
fi
zplug load

# BEGIN ANSIBLE MANAGED BLOCK
# source autojump
if [[ "$(uname)" == "Darwin" ]]; then
  source "/usr/local/share/autojump/autojump.zsh"
else
  source /usr/share/autojump/autojump.zsh
fi
# END ANSIBLE MANAGED BLOCK
