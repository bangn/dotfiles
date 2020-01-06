function export_path() {
  if [[ ! "$PATH" == *"$1"* ]]; then
    export PATH="${PATH:+${PATH}:}/$1"
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

for p in "$PATHS"; do
  export_path "$p"
done

export DOTFILES="$HOME/dotfiles"

export EDITOR='nvim'
export VISUAL='nvim'

# Use nvim/vim to open man page.
case $EDITOR in
    nvim) export MANPAGER="nvim +'set ft=man' -" ;;
     vim) export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\"" ;;
       *) export MANPAGER='less' ;;
esac

# Use solarized dark for terminal color
if [[ $(uname) == "Linux" ]]; then
  eval $(dircolors "$HOME"/dircolors.solarized.256.dark)
else
  eval $(gdircolors "$HOME"/dircolors.solarized.256.dark)
fi

# For postgres docker
export PGUSER='postgres'
export PGHOST='localhost'

# Added by the Heroku Toolbelt
export_path "/usr/local/heroku/bin"

# Source nix package manager and fix perl locale warning
if [[ ! "$PATH" == *$HOME/.nix-profile/bin* ]]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi
export LOCALE_ARCHIVE="$(readlink ~/.nix-profile/lib/locale)/locale-archive"

# Source all of the .sh files in $HOME/.shell
for file in $HOME/.shell/*; do
  source $file
done
# End Source all of the .sh files in $HOME/.shell

# asdf
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# Add Golang path
export ASDFROOT=$HOME/.asdf
export ASDFINSTALLS=$HOME/.asdf/installs
export GOPATH="$HOME/src/golang"
GOV=$(asdf current golang | sed 's/\s*(set by .*)//g')
export GOROOT=$ASDFINSTALLS/golang/$GOV/go/
export_path "$GOPATH/bin"
export GOROOT_BOOTSTRAP=$GOROOT
# End Golang path

# zsh syntax highlighting.
source $DOTFILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh autosuggestions
source $DOTFILES/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59' # Make suggestion more visible with solarized dark.
# End zsh-autosuggestions

 #zsh substring search
source $DOTFILES/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# Updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc";
fi

# Enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc";
fi

# Allow ssh key/identity to be reloaded.
ssh-add -K 2>/dev/null

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Setting fd as the default source for fzf
# fzf find hidden files.
export FZF_DEFAULT_COMMAND='fd --type f --ignore-case --hidden --exclude .git --exclude deps --exclude _build'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Change output of `time` command format(make it same as bash output).
export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

# Fix nix setlocale problems
# https://qiita.com/kimagure/items/4449ceb0bda5c10ca50f
if [[ -z "$LOCALE_ARCHIVE_2_27" && ! "$(uname)" == "Darwin" ]]; then
  glibcLocales=$(nix-build --no-out-link "<nixpkgs>" -A glibcLocales)
  export LOCALE_ARCHIVE_2_27="${glibcLocales}/lib/locale/locale-archive"
fi

# direnv
if [[ ! -z $(which direnv) ]]; then
  eval "$(direnv hook zsh)"
fi

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

# BEGIN ANSIBLE MANAGED BLOCK
# source autojump
if [[ "$(uname)" == "Darwin" ]]; then
  source "/usr/local/share/autojump/autojump.zsh"
else
  source /usr/share/autojump/autojump.zsh
fi
# END ANSIBLE MANAGED BLOCK
