alias rddm='rake db:drop; rake db:create; rake db:migrate'
alias rdm='rake db:migrate'
alias rds='rake db:seed'
alias rdtp='rake db:test:prepare'
alias rdsl='rake db:structure:load'

# Rails 2 and Rails 3 console
rc () {
  if [ -e "./script/console" ]; then
    ./script/console --debugger "$@"
  else
    rails console "$@"
  fi
}

# Rails 2 and Rails 3 server
rs () {
  if [ -e "./script/server" ]; then
    ./script/server --debugger --binding=127.0.0.1 "$@"
  else
    rails server --binding=127.0.0.1 "$@"
  fi
}

rails_versions() {
  filename=Gemfile.lock
  for gemfile in **/$filename; do
    app=$(echo "$gemfile" | sed "s/\/$filename//g")
    rails_version=$(grep ' rails (\d' "$gemfile")
    printf "$fg[magenta] $app: $fg[green] $rails_version"
    echo "$reset_color"
  done
}
