export BINSTUBS_PATH="./bin:./.bundle/bin:./.bundle/binstubs"
export LOCAL_BIN="/usr/local/bin"
export LOCAL_SBIN="/usr/local/sbin"
export BCC_TOOLS_BIN="/usr/share/bcc/tools"
export DOTFILES_TOOLS_BIN="$HOME/dotfiles/tools/bin"
export PATH="$BINSTUBS_PATH:$LOCAL_BIN:$LOCAL_SBIN:$BCC_TOOLS_BIN:$DOTFILES_TOOLS_BIN:$PATH"

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
eval $(dircolors "$HOME"/dircolors.solarized.256.dark)

# For postgres docker
export PGUSER='postgres'
export PGHOST='localhost'

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add Golang path
export GOROOT="/usr/local/go"
export GOPATH="$HOME/src/golang"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"
export GOROOT_BOOTSTRAP=$GOROOT
# End Golang path

# Source all of the .sh files in $HOME/.shell
for file in $HOME/.shell/*; do
  source $file
done
# End Source all of the .sh files in $HOME/.shell

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
# End chruby

# zsh syntax highlighting.
source $DOTFILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh autosuggestions
source $DOTFILES/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59' # Make suggestion more visible with solarized dark.
# End zsh-autosuggestions

# zsh substring search
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
# Setting ag as the default source for fzf
# fzf find hidden files.
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore deps --ignore _build -g ""'

# Change output of `time` command format(make it same as bash output).
export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

# asdf
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
