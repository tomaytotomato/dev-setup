docker-clean() {
  _containers=$(docker ps --quiet --filter 'status=exited')
  [[ -z ${_containers// } ]] || docker rm $_containers

  _images=$(docker images --all --quiet --filter 'dangling=true')
  [[ -z ${_images// } ]] || docker rmi $_images
}
docker-start() {
  [ -S /var/run/docker.sock ] || sudo service docker start
}
docker-stop() {
  [ ! -S /var/run/docker.sock ] || sudo service docker stop
}
