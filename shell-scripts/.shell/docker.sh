#! /bin/bash

# Use docker buildkit as default to improve build performance
export DOCKER_BUILDKIT=1

# Start docker daemon
if [[ $(uname) == "Darwin" ]]; then
  alias dkon='source /Applications/Docker/Docker\ Quickstart\ Terminal.app/Contents/Resources/Scripts/start.sh'
fi

# Stop all containers
alias dkstc='docker stop $(docker ps -a -q)'

# Remove all stopped containers
dkrmc() {
  docker ps -aq -f status=exited | xargs -I {} docker rm {}
}

# Remove all unstagged images
dkrmi() {
  docker images | grep '^<none>' | awk '{print $3}' | xargs -I {} -P 3 docker image rm {}
}

# Alias docker-machine
alias dkm='docker-machine'

# Alias docker-compose
alias dkc='docker-compose'
