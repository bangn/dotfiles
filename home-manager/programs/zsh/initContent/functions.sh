#! /usr/bin/env bash

# open the specified file in the default program, or
# fallback to opening the current directory in Finder
o() {
  if [[ "$(uname)" == "Darwin" ]]; then
    open "${1:-.}"
  elif [[ "$(uname)" == "Linux" ]]; then
    xdg-open "${1:-.}"
  fi
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
  python3 -m http.server "${1:-3000}"
}

# export env var from .env file
export_env() {
  env=${1:-.env}
  while IFS='' read -r line || [ -n "$line" ]; do
    # shellcheck disable=SC2039
    if [[ ! "$line" == \#* ]] && [[ -n "$line" ]]; then
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
    if [[ ! "$line" == \#* ]] && [[ -n "$line" ]]; then
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
    if [[ ! "$line" == \#* ]] && [[ -n "$line" ]]; then
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
  psql -d postgres -c "
    SELECT pg_database.datname AS dbname,
      pg_size_pretty(pg_database_size(pg_database.datname)) AS size
    FROM pg_database ORDER BY dbname DESC;
  "
}

db_tables_size() {
  psql -d "$1" -c "
    SELECT schemaname AS table_schema,
           relname AS table_name,
           pg_size_pretty(pg_relation_size(relid)) AS data_size
    from pg_catalog.pg_statio_user_tables
    ORDER BY pg_relation_size(relid) DESC;
  "
}

backupdb() {
  usage="Usage: backupdb database_name"

  if [ -e "$1" ]; then
    datetime=$(date +"%G_%m_%d_%H_%M_%S")
    psql -d "$1" -c "
      CREATE DATABASE $1_$datetime
      WITH TEMPLATE $1
    "
  else
    echo "$usage"
  fi
}

# public ip address
public_ip() {
  dig +short myip.opendns.com @resolver1.opendns.com.
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
  if [[ "$(uname)" == "Darwin" ]]; then
    grep "$1" -rl "${3:-.}" | xargs -I file sed -i "" "s/$1/$2/g" file
  elif [[ "$(uname)" == "Linux" ]]; then
    grep "$1" -rl "${3:-.}" | xargs -I file sed -i "s/$1/$2/g" file
  fi
}

today() {
  date +"%d-%m-%Y"
}

rubodiff() {
  git status -sb | tail +2 | awk '{print $NF}' | grep "\.rb" | xargs -I {} rubocop {}
}

rebuild-system() {
  if [[ "$(uname)" == "Darwin" ]]; then
    sudo darwin-rebuild switch "$@"
  elif [[ "$(uname)" == "Linux" ]]; then
    home-manager switch "$@"
  fi
}
