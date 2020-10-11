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

git_update_hub_config() {
  config_file="./.git/config"
  host="github.com"

  if [[ -f "$config_file" ]] && ! grep -q "\\[hub\\]" "$config_file"; then
    cat <<EOF | tee -a "$config_file"
[hub]
  host = $host
  protocol = ssh
EOF
  fi
}

git_update_local_config() {
  git_update_user_config
  git_update_hub_config
}
