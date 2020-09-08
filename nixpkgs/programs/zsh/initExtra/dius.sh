# shellcheck disable=SC2164

################################################################################
# DiUS
################################################################################
cdd() {
  cd "$HOME/dev/dius/$1"
}

git_update_user_config() {
  config_file="./.git/config"

  if [[ -f "$config_file" && "$PWD" =~ dius ]] && ! grep -q "\\[user\\]" "$config_file"; then
    cat <<EOF | tee -a "$config_file"
[user]
  name = bangn
  email = bnguyen@dius.com.au
EOF
  fi
}

########################################
# nib
########################################

cdn() {
  cd "$HOME/dev/dius/nib/$1" && git_update_local_config
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

####################
# niss
####################

# Theses functions is tightly couple with tmux
# I dont care much about the coupling here as tmux is used daily in my workflow
nissup() {
  local up_with="$1"
  local session=niss
  local ignore

  if [ -z "$up_with" ] || [ "$up_with" = "ui" ]; then
    ignore="niss-admin"
  else
    ignore="niss-ui"
  fi

  for pane in $(tmux list-panes -t "$session" -F "#{pane_current_path}:#W.#P" | grep -v "$ignore"); do
    paneId=$(echo "$pane" | awk -F ":" '{print $2}')
    if [[ "$pane" =~ "nailgun" ]]; then
      tmux send-keys -t "$paneId" "be rackup -p 8080" Enter
    else
      tmux send-keys -t "$paneId" "npm run start.dev" Enter
    fi
  done

  echo "niss servers are starting up"
}

nissdown() {
  local session=niss
  for pane in $(tmux list-panes -t "$session" -F "#{pane_current_path}:#W.#P"); do
    paneId=$(echo "$pane" | awk -F ":" '{print $2}')
    tmux send-keys -t "$paneId" C-C
  done

  echo "niss servers are down"
}
