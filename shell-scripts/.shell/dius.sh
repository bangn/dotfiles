#! /bin/bash
# shellcheck disable=SC2164

cdd() {
  cd "$HOME/dev/dius/$1"
}

cdn() {
  cd "$HOME/dev/dius/nib/$1" && git_update_local_config
}

git_update_user_config() {
  config_file="./.git/config"

  if [[ -f "$config_file" && "$PWD" =~ dius ]] && ! grep -q "\\[user\\]" "$config_file"; then
    cat << EOF | tee -a "$config_file"
[user]
  name = bangn
  email = bnguyen@dius.com.au
EOF
  fi
}

git_update_hub_config() {
  config_file="./.git/config"
  host="github.com"

  if [[ "$PWD" =~ nib ]]; then
    host="git.nib.com.au"
  fi

  if [[ -f "$config_file" ]] && ! grep -q "\\[hub\\]" "$config_file"; then
    cat << EOF | tee -a "$config_file"
[hub]
  host = "$host"
  protocal = ssh
EOF
  fi
}

git_update_local_config() {
  git_update_user_config
  git_update_hub_config
}
