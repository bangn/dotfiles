#! /bin/bash

# Edit Shell Profile, Source Shell Profile
alias ssp='source ~/.zshrc'

if [[ "$(uname)" == "Darwin" ]]; then
  alias ll='/usr/local/bin/gls --color=auto -Glah'
  alias l='/usr/local/bin/gls --color=auto -Glah'
else
  alias ll='ls --color=auto -Glah'
  alias l='ls --color=auto -Glah'
fi

alias rake='noglob rake'
alias fix-enter-key='stty sane'

# heroku
alias hra='heroku restart --app'
alias hlt='heroku logs --tail'
alias hmdb='heroku run rake db:migrate'
alias hrdb='heroku pg:reset'

# smith
alias agency='bundle exec agency'
alias smithctl='bundle exec smithctl'

# terraform
alias tf=terraform

# Fast file move/rename; run `mmv` for usage
autoload -U zmv
alias mmv='noglob zmv -W'
# End Fast file move/rename; run `mmv` for usage

# GREP_OPTIONS is deprecated
GREP_OPTIONS=$(cat <<EOF
  --color=auto \
  --exclude-dir="*snapshots*" \
  --exclude-dir="dist*" \
  --exclude-dir=.git \
  --exclude-dir=.stack-work \
  --exclude-dir=.stack \
  --exclude-dir=_build \
  --exclude-dir=coverage \
  --exclude-dir=deps \
  --exclude-dir=node_modules \
  --exclude-dir=tmp \
  --exclude=tags
EOF
)
# shellcheck disable=SC2139
alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS

# pbcopy and pbpatse for Linux.
if [[ "$(uname)" == "Linux" ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# use nvim
alias vim='nvim'

# use bat instead of cat
alias cat='bat'
