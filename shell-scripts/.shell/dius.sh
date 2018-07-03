#! /bin/bash
# shellcheck disable=SC2164

cdd() {
  cd "$HOME/dev/dius/$1"
}

cdn() {
  cd "$HOME/dev/dius/nib/$1" && update_local_git_config
}

update_git_user_config() {
  config_file="./.git/config"

  if [[ -f "$config_file" && "$PWD" =~ dius ]] && ! grep -q "\[user\]" "$config_file"; then
    cat << EOF | tee -a "$config_file"
[user]
  name = bangn
  email = bnguyen@dius.com.au
EOF
  fi
}

update_git_host_config() {
  config_file="./.git/config"
  host="github.com"

  if [[ "$PWD" =~ nib ]]; then
    host="git.nib.com.au"
  fi

  if [[ -f "$config_file" ]] && ! grep -q "\[host\]" "$config_file"; then
    cat << EOF | tee -a "$config_file"
[host]
  hub = "$host"
  protocal = ssh
EOF
  fi
}

update_local_git_config() {
  update_git_user_config
  update_git_host_config
}
