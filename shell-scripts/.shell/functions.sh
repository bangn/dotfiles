#!/bin/bash

# open the specified file in the default program, or
# fallback to opening the current directory in Finder
o() {
  if [[ "$(uname)" == "Darwin" ]]; then
    open "${1:-.}"
  elif [[ "$(uname)" == "Linux" ]]; then
    xdg-open "${1:-.}"
  fi
}

# pass specified files/folders to your editor, fallback to current directory
# usage:
# $ e ~/.zshrc .shell/
# $ e
e() {
  $EDITOR "${@:-.}"
}

rmfiles() {
  find . -type f -name "$1" -delete
}

remove_spaces_in_filenames() {
  if [ -z "$1" ]; then
    echo "provide target directory"
    return 1
  fi

  find "$1" -type f -name "* *" | while read -r FILE; do
    mv -v "$FILE" "$(echo "$FILE" | tr ' ' '-')"
  done
}

# reset development database
resetdb() {
  bundle exec rake db:drop db:create db:migrate db:seed
  bundle exec rake db:test:prepare
}

# reset sequel database
resetsqdb() {
  MIGRATION_DIR=''
  if [ "$2" ]; then
    MIGRATION_DIR=$2
  else
    MIGRATION_DIR='db/migrate'
  fi

  if [ "$1" ]; then
    echo dropdb "$1"
    dropdb --if-exists "$1"

    echo createdb "$1"
    createdb "$1"

    echo migrate "$1"
    be sequel -m "$MIGRATION_DIR" "postgres:///$1"
  else
    echo "Usage: resetsqdb database-name migrations-directory(optional)"
  fi
}

# start simple server
simser() {
  python -m SimpleHTTPServer "$1"
}

# export env var from .env file
export_env() {
  env=${1:-.env}
  while IFS='' read -r line || [ -n "$line" ]; do
    # shellcheck disable=SC2039
    if [[ ! "$line" == \#* ]] && [[ ! -z "$line" ]]; then
      echo export "$line"
      # shellcheck disable=SC2163
      export "$line"
    fi
  done <"$env"

  echo "Done!"
}

# unset env var of .env file
unset_env() {
  env=${1:-.env}
  while IFS='' read -r line || [ -n "$line" ]; do
    # shellcheck disable=SC2039
    if [[ ! "$line" == \#* ]] && [[ ! -z "$line" ]]; then
      ENV_VAR=$(echo "$line" | cut -f1 -d'=')
      echo "unset $ENV_VAR"
      unset "$ENV_VAR"
    fi
  done <"$env"

  echo "Done!"
}

# unload .envrc
# This is a work around until direnv provides unload command
# Note it only works if .envrc is only contains simple export env var
unload_envrc() {
  envrc=${1:-.envrc}
  while IFS='' read -r line || [ -n "$line" ]; do
    # shellcheck disable=SC2039
    if [[ ! "$line" == \#* ]] && [[ ! -z "$line" ]]; then
      ENV_VAR=$(echo "$line" | cut -f1 -d'=' | sed 's/export //g')
      echo "unset $ENV_VAR"
      unset "$ENV_VAR"
    fi
  done <"$envrc"

  echo "Done!"
}

dashify() {
  if [ -e "$1" ]; then
    local new_filename
    new_filename="$(echo "$1" | xargs -I {} neighbour-squasher -i {} | tr '_| ' '-' | awk '{print tolower($0)}')"
    echo Moved "$1" to "$new_filename"
    mv "$1" "$new_filename"
  else
    echo "Usage: dashify file/directory"
  fi
}

underscorify() {
  if [ -e "$1" ]; then
    local new_filename
    new_filename="$(echo "$1" | xargs -I {} neighbour-squasher -i {} | tr '\-| ' '_' | awk '{print tolower($0)}')"
    echo Moved "$1" to "$new_filename"
    mv "$1" "$new_filename"
  else
    echo "Usage: underscorify file/directory"
  fi
}

exclude_patterns() {
  exclude="-false" # need to start the list somewhere so we have the right number of "-or"

  for exclude_folder in '.git' '.bundle' 'tmp' 'log'; do
    exclude="$exclude -or -name $exclude_folder -prune"
  done

  # hm, time to switch to whitelist?
  for exclude_file in 'Gemfile.lock' 'structure.sql' '*.gif' '*.jpg' '*.png' '*jquery*' '*.doc' '*.pdf' '*.zip' '*.ico' '*.swf' '*.sqlite' '*.ttf' '*.csv' '*.otf' '*.svg' '*.woff' '*.ai' '*.eps' '*.psd' '*.xlsx'; do
    exclude="$exclude -or -iname $exclude_file"
  done

  echo "$exclude"
}

code_file_list() {
  find "${@:-.}" -not \( "$(exclude_patterns)" \) -type f -print0
}

dbsize() {
  psql -d postgres -c "SELECT pg_database.datname as dbname, pg_size_pretty(pg_database_size(pg_database.datname)) AS size FROM pg_database ORDER BY dbname DESC"
}

# Check ssl info
# @param cert.pem
sslinfo() {
  openssl x509 -text -noout -in "$1"
}

# Clear purgeable disk space
# Need to add tmutil command to sudo list.
clear_purgeable() {
  sudo tmutil disable && sudo tmutil enable
}

# public ip address
public_ip() {
  dig +short myip.opendns.com @resolver1.opendns.com.
}

# asdf reshim plugin
asdf_reshim() {
  if ! [[ -z "$1" ]]; then
    asdf reshim "$1"
  else
    asdf plugin-list | xargs -Ip asdf reshim p
  fi
}

# Remove node_modules recursively
rm_node_modules() {
  dir="${1:-.}"
  find "$dir" -name "node_modules" -exec rm -rf {} +
}

# mkdir and cd
mkcd() {
  mkdir -p "$@" && cd "$_" || return
}

# find and replace all
fara() {
  grep "$1" -rl . | xargs -I file sed -i "s/$1/$2/g" file
}
