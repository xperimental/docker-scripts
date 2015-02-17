#!/bin/bash
# Cleans the docker daemon of all images that are not connected to any tagged image
docker images -aqf dangling=true | xargs docker rmi
