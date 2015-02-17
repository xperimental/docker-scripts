#!/bin/bash
# Stops all currently running containers
docker ps -qf status=running | xargs docker stop
