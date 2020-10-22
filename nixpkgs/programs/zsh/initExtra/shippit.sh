#! /usr/bin/env bash

# shellcheck disable=SC2164

################################################################################
# shippit
################################################################################
cdsh() {
  cd "$HOME/dev/shippit/$1" && git_update_local_config
}

git_update_user_config() {
  config_file="./.git/config"

  if [[ -f "$config_file" && "$PWD" =~ shippit ]] && ! grep -q "\\[user\\]" "$config_file"; then
    cat <<EOF | tee -a "$config_file"
[user]
  name = bangn
  email = bang.nguyen@shippit.com
EOF
  fi
}

git_update_local_config() {
  git_update_user_config
}

backup_db() {
  db_name=${1:-shippit_development}
  psql -c "\
    CREATE DATABASE ${db_name}_$(date +%Y_%m_%d) \
    WITH TEMPLATE ${db_name} OWNER postgres \
  "
}

alias gprod="git pull --rebase origin develop"
alias gcod="git checkout develop"
alias gdod="git diff origin/develop"
