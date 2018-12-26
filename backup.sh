#!/bin/bash

VOLUME=BetterThanWolves

# Verify that Volume provided is an existing volume
if [ -z "$VOLUME" ] || [ -z "$(docker volume list | grep $VOLUME)" ]; then
	echo "Must be a registered Docker volume"
	echo "The following are the current Docker volumes:"
	docker volume list
	exit -1
fi

echo "Performing a backup of $VOLUME"
BACKUP=$RANDOM.tar.bz2
docker run -it --rm \
	-v $VOLUME:/volume \
	-v "$(pwd)":/backup \
	alpine \
	tar -cjf /backup/$BACKUP -C /volume ./

[ ! -f $(pwd)/$BACKUP ] && echo "Backup file was not created" && exit -1
echo "Volume backed up to:"
echo "$(pwd)/$BACKUP"