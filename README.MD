A Docker project to build the Better Than Wolves Minecraft server.

[Official Better Than Wolves forum](http://www.sargunster.com/btwforum)

## Requirements

This project assumes that Docker is installed and that the user has 
some basic knowledge of docker commands.

You also need to have downloaded a version of the Better Than Wolves
mod zip file before you can run this project.

## Running

To run this project we need to start the `docker run` command in the folder 
where the BTW Mod zip was downloaded to:

```
docker run -ti \
    --name btw-server \
    -p 25565:25565 \
    -v "$(pwd)":/mod \
    --mount source=BetterThanWolves,target=/opt/server/world \
    gencore/btw-server:latest
```

If you are running from Windows then a similar command can be used to
locate the zip file in the current folder:

```
docker run -ti \
    --name btw-server \
    -p 25565:25565 \
    -v "%cd%":/mod \
    --mount source=BetterThanWolves,target=/opt/server/world \
    gencore/btw-server:latest
```

This will allow the Docker container. As part of first startup the 
Docker container will download the 1.5.2 Minecraft server and patch
it with the BTW Mod zip. This only happens on the first startup.

Then to stop the server, we can press CTRL + C to stop the server.

## Restarting

If we want to re-start the server then we can use the following commands:

```
docker start btw-server
```

This will start the server in the background. To attach to this server and
issue server commands we can use `docker attach`:

```
docker attach btw-server
```

Or if you are interested in the logs of the server we can use:

```
docker logs -f btw-server
```

Finally to stop the server we can use:

```
docker stop btw-server
```

To issue the shutdown signal.

## Backup World

The world data is contained within a Docker volume called `BetterThanWolves` and
can be extracted to the local folder using the following command:

```
docker run -it --rm \
    -v BetterThanWolves:/volume \
    -v "$(pwd)":/backup \
    alpine \
    tar -cjf /backup/backup.tar.bz2 -C /volume ./
```

Which will create a file in the local folder called `backup.tar.bz2`.

## Restore World

If we wish to restore a backup then we should ensure that first the volume, then we can issue the following command:

```
docker volume rm -f BetterThanWolves
```

Then we can copy the backup data into the volume using:

```
docker run -it --rm \
    -v BetterThanWolves:/volume \
    -v "$(pwd)":/backup \
    alpine \
    tar -vxjf /backup/backup.tar.bz2 -C /volume
```

## License

Mojang's Minecraft and FlowerChild's BetterThanWolves are licensed by their respective
owners. No binaries are distributed as part of this Docker image.

This project is licensed under a MIT License.