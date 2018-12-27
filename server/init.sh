#!/bin/bash
# Given the BTW Mod zip, download repackage the Minecraft 1.5.2 server.

set -e

# Idempotent check
SERVER_JAR=/opt/server/minecraft_server.jar
if [ -f "$SERVER_JAR" ]; then
	exit 0
fi

ZIP=$(ls -1t /mod/BTWMod*.zip | head -n 1)

# Verify ZIP file provided
if [ ! -f "$ZIP" ]; then
	echo "Error: No BTW Mod zip provided!"
	exit -1
fi

# Download Minecraft Server and unzip
echo "Downloading Minecraft Server..."
mkdir /tmp/server
cd /tmp/server
curl -# -O https://s3.amazonaws.com/Minecraft.Download/versions/1.5.2/minecraft_server.1.5.2.jar
unzip -q minecraft_server.1.5.2.jar
rm minecraft_server.1.5.2.jar


# Unzip MINECRAFT_SERVER-JAR from Mod
echo "Unpacking $ZIP..."
unzip -q $ZIP 'MINECRAFT_SERVER-JAR/*' -d /tmp/server
(cd /tmp/server/MINECRAFT_SERVER-JAR && cp -r * ..)
rm -rf /tmp/server/MINECRAFT_SERVER-JAR

# Repack the files into a new minecraft_server.jar
echo "Building new minecraft_server.jar..."
cd /tmp/server
jar cfe minecraft_server.jar net.minecraft.server.MinecraftServer *
mv minecraft_server.jar $SERVER_JAR

echo "Adding BTWConfig.txt..."
unzip $ZIP 'BTWConfig.txt' -d /opt/server

echo "Cleaning up work folder..."
rm -rf /tmp/server