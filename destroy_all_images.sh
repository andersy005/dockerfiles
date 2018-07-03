#!/bin/bash
# Warning: This will destroy all your images and containers. It will not be possible to restore them!
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)