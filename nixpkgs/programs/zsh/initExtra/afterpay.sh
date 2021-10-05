# shellcheck disable=SC2164

####################
# niss
####################

# Theses functions is tightly couple with tmux
# I dont care much about the coupling here as tmux is used daily in my workflow
# nissup() {
#   up_with="$1"
#   session=niss
#   ignore

#   if [ -z "$up_with" ] || [ "$up_with" = "ui" ]; then
#     ignore="niss-admin"
#   else
#     ignore="niss-ui"
#   fi

#   for pane in $(tmux list-panes -t "$session" -F "#{pane_current_path}:#W.#P" | grep -v "$ignore"); do
#     paneId=$(echo "$pane" | awk -F ":" '{print $2}')
#     # shellcheck disable=SC3010
#     if [[ "$pane" =~ "nailgun" ]]; then
#       tmux send-keys -t "$paneId" "be rackup -p 8080" Enter
#     else
#       tmux send-keys -t "$paneId" "npm run start.dev" Enter
#     fi
#   done

#   echo "niss servers are starting up"
# }

# nissdown() {
#   session=niss
#   for pane in $(tmux list-panes -t "$session" -F "#{pane_current_path}:#W.#P"); do
#     paneId=$(echo "$pane" | awk -F ":" '{print $2}')
#     tmux send-keys -t "$paneId" C-C
#   done

#   echo "niss servers are down"
# }

MONEY_DIR="$HOME/dev/money"
updb() {
  # shellcheck disable=SC3044
  pushd "$MONEY_DIR"
  docker-compose up -d
  # shellcheck disable=SC3044
  popd
}

stopdb() {
  # shellcheck disable=SC3044
  pushd "$MONEY_DIR"
  docker-compose stop
  # shellcheck disable=SC3044
  popd
}
