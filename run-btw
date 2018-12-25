#!/bin/bash
# Locate and run the Docker image based on its tags.

IMAGE=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep btw-server | head -n 1)

if [ -z "$IMAGE" ]; then
	echo "The Docker image has not been build, please run build-btw."
	exit -1
fi

RUN_CMD=$(docker inspect --format "{{ index .Config.Labels.RUN }}" $IMAGE | cut -c 2-)
echo $RUN_CMD
$RUN_CMD