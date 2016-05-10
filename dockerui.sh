#!/bin/bash
# dockerui is a simple web UI for controlling the docker daemon
#
# This is a simple helper script to pull the image and start a container
# accessing the local docker daemon (via UNIX socker)
#
# Expects port tcp/9000 to be unused.
#

readonly IMAGE=uifd/ui-for-docker

docker inspect dockerui | grep -q "\"Running\": true" && {
  echo Stopping running container...
  docker stop dockerui
}

echo Checking for new version...
docker pull $IMAGE | grep -q "Downloaded newer image" && {
  echo New image version. Removing container...
  docker rm dockerui
}

echo Starting dockerui...
docker start dockerui || docker run --name dockerui -d -v /var/run/docker.sock:/var/run/docker.sock -p 9000:9000 $IMAGE
