#!/bin/bash
# This script requires that you have downloaded the BTW Mod zip file.

cd server

ZIP=$(ls *.zip)
VERSION=$(echo $ZIP | cut -d '.' -f 1)
[ ! -f "$ZIP" ] && echo "Please download the BTW Mod Zip to $(pwd)" && exit -1
docker build . --build-arg VERSION=$VERSION --tag btw-server:$VERSION