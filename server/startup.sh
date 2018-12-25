#!/bin/bash

set -e

# Startup Minecraft server
# Optimise GC
cd /opt/server
java -server \
	-Xmx1024M \
	-XX:+UseConcMarkSweepGC \
	-XX:+UseParNewGC \
	-XX:+CMSIncrementalPacing \
	-XX:ParallelGCThreads=2 \
	-XX:+AggressiveOpts \
	-jar minecraft_server.jar nogui