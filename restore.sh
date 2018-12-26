#!/bin/bash

BACKUP=$1
[ ! -f "$BACKUP" ] && echo "Error: First argument must be a backup tar.bz2 file" && exit -1
VOLUME=$2
[ -z "$VOLUME" ] && echo "Error: Second argument must be a Volume to restore into" && exit -1

# Verify that Volume provided is an existing volume
if [ -n "$(docker volume list | grep $VOLUME)" ]; then
	echo "Volume must not exist already"
	echo "Please delete the volume first before attempting to restore"
	echo ""
	echo "docker volume rm $VOLUME"
	exit -1
fi

echo "Restoring $BACKUP into $VOLUME"
docker run -it --rm \
	-v $VOLUME:/volume \
	-v "$(pwd)":/backup \
	alpine \
	tar -vxjf /backup/$BACKUP -C /volume