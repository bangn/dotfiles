#! /bin/bash

# Alias docker
alias d='docker'

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

# To list all running and stopped containers
# docker ps -a

# To list all running containers (just stating the obvious and also example use of -f filtering option)
# docker ps -a -f status=running

# To list all running and stopped containers, showing only their container id
# docker ps -aq

# To remove all containers that are NOT running
# docker rm `docker ps -aq -f status=exited`
