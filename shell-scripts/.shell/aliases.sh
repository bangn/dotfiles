#! /bin/bash
# Edit Shell Profile, Source Shell Profile
alias ssp='source ~/.zshrc'

if [[ "$(uname)" == "Darwin" ]]; then
  alias ll='ls -Glah'
  alias l='ls -Glah'
else
  alias ll='ls --color=auto -Glah'
  alias l='ls --color=auto -Glah'
fi

alias rake='noglob rake'
alias fix-enter-key='stty sane'

# alias server='python -m SimpleHTTPServer'
alias server='ruby -run -e httpd . -b127.0.0.1 -p3000'

# heroku
alias hra='heroku restart --app'
alias hlt='heroku logs --tail'
alias hmdb='heroku run rake db:migrate'
alias hrdb='heroku pg:reset'

# git=hub
alias git=hub

# smith
alias agency='bundle exec agency'
alias smithctl='bundle exec smithctl'

# terraform
alias tf=terraform

# Fast file move/rename; run `mmv` for usage
autoload -U zmv
alias mmv='noglob zmv -W'
# End Fast file move/rename; run `mmv` for usage

# rabbitmq
alias rbdq='rabbitmq_delete_all_queues'
alias rbde='rabbitmq_delete_all_exchanges'

# GREP_OPTIONS is deprecated
GREP_OPTIONS='--color=auto --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=dist --exclude-dir=deps --exclude-dir=_build --exclude-dir=tmp --exclude=tags'
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
