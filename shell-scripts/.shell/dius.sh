#! /bin/bash
# shellcheck disable=SC2164

cdd() {
  cd "$HOME/dev/dius/$1"
}

cdn() {
  cd "$HOME/dev/dius/nib/$1"
}

update_git_user_config() {
  cat << EOF | tee -a ./.git/config
[user]
    name = bangn
    email = bnguyen@dius.com.au
EOF
}
