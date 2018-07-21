export BINSTUBS_PATH="./bin:./.bundle/bin:./.bundle/binstubs"
export LOCAL_BIN="/usr/local/bin:$HOME/.local/bin"
export LOCAL_SBIN="/usr/local/sbin"
export BCC_TOOLS_BIN="/usr/share/bcc/tools"
export DOTFILES_TOOLS_BIN="$HOME/dotfiles/tools/bin"
export PATH="$LOCAL_BIN:$LOCAL_SBIN:$CARGO_BIN:$CABAL_BIN:$HASKELL_BIN:$BINSTUBS_PATH:$BCC_TOOLS_BIN:$DOTFILES_TOOLS_BIN:$PATH"

export DOTFILES="$HOME/dotfiles"

export EDITOR='nvim'
export VISUAL='nvim'

# Use nvim/vim to open man page.
case $EDITOR in
    nvim) export MANPAGER="nvim +'set ft=man' -" ;;
     vim) export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\"" ;;
       *) export MANPAGER='less' ;;
esac

# Source all of the .sh files in $HOME/.shell
for file in $HOME/.shell/*; do
  source $file
done
# End Source all of the .sh files in $HOME/.shell

# asdf
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# zsh syntax highlighting.
source $DOTFILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh autosuggestions
source $DOTFILES/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59' # Make suggestion more visible with solarized dark.
# End zsh-autosuggestions

# zsh substring search
source $DOTFILES/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# Allow ssh key/identity to be reloaded.
ssh-add -K 2>/dev/null

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Setting ag as the default source for fzf
# fzf find hidden files.
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore deps --ignore _build -g ""'

# Change output of `time` command format(make it same as bash output).
export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

# BEGIN ANSIBLE MANAGED BLOCK
# source autojump
if [[ "$(uname)" == "Darwin" ]]; then
  source "/usr/local/share/autojump/autojump.zsh"
else
  source /usr/share/autojump/autojump.zsh
fi
# END ANSIBLE MANAGED BLOCK
