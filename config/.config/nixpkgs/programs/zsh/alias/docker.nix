{
  # Stop all containers
  dkstc = "docker stop $(docker ps -a -q)";
  # Remove all stopped containers
  dkrmc = "docker ps -aq -f status=exited | xargs -I {} docker rm {}";
  # Remove all unstagged images
  dkrmi = "docker images | grep '^<none>' | awk '{print $3}' | xargs -I {} -P 3 docker image rm {}";
}
