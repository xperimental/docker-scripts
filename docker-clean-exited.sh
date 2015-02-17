#!/bin/bash
# Cleans the docker daemon of all containers which are not running anymore
docker ps -aqf status=exited | xargs docker rm
