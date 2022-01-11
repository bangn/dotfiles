# shellcheck disable=SC2164

####################
# servers
####################

# Theses functions is tightly coupled with tmux window and pane name
server() {
  service_name="$1"
  op="$2"
  usage="Usage: server [api|stubby] [up|down]"

  # shellcheck disable=SC3010
  if ! [[ "$op" == "up" || "$op" == "down" || "$service_name" == "api" || "$service_name" == "stubby" ]]; then
    echo "$usage"
    return
  fi

  window="money-servers"

  for pane in $(tmux list-panes -t "$window" -F "#{pane_current_path}:#W.#P"); do
    paneId=$(echo "$pane" | awk -F ":" '{print $2}')
    # shellcheck disable=SC3010
    # shellcheck disable=SC2076
    if [[ "$pane" =~ "$service_name" ]]; then
      if [[ "$op" == "up" ]]; then
        echo "Starting $service_name ..."
        tmux send-keys -t "$paneId" "be rails s" Enter
        sleep 3
        echo "$service_name server is up !!!"
      fi

      if [[ "$op" == "down" ]]; then
        echo "Shutting down $service_name ..."
        tmux send-keys -t "$paneId" C-C
        sleep 3
        echo "$service_name server is down !!!"
      fi
    fi
  done
}

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

cop_api() {
  # shellcheck disable=SC3044
  pushd "$MONEY_DIR"/api
  git diff origin/main --name-only |
    grep "\.rb" |
    sed 's/api\///' |
    xargs bundle exec rubocop
  # shellcheck disable=SC3044
  popd
}

spec_api() {
  # shellcheck disable=SC3044
  pushd "$MONEY_DIR"/api
  git diff origin/main --name-only |
    sed 's/api\///' |
    grep "\.rb" |
    grep _spec |
    xargs bundle exec rspec
  # shellcheck disable=SC3044
  popd
}
