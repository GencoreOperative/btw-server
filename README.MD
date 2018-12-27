A Docker project to build the Better Than Wolves Minecraft server.

This Dockerfile requires that you have downloaded the Better Than Wolves
mod from the [official forum](http://www.sargunster.com/btwforum).

## Requirements

This project assumes that Docker is installed and that the user has 
some basic knowledge of docker commands.

You also need to have downloaded a version of the Better Than Wolves
mod zip file before you can run this project.

## Running

To run this project, we need to provide the location of where the Zip file
is downloaded to the `docker run` command. The following example assumes
that the zip is located in the current folder:

```
docker run -d --name btw-server -p 25565:25565 -v ${pwd}:/mod --mount source=BetterThanWolves,target=/opt/server/world btw-server:latest
```

If you are running from Windows then a similar command can be used to
locate the zip file in the current folder:

```
docker run -d --name btw-server -p 25565:25565 -v %cd%:/mod --mount source=BetterThanWolves,target=/opt/server/world btw-server:latest
```

This will allow the Docker container to find the zip file in the current
folder and then use it to patch a 1.5.2 Minecraft server. The newly
patched server is then started.

If you wish to issue server commands we can use the `docker attach` 
command to connect to the named container:

```
docker attach btw-server
```

Or if we simply want to see the logs from the server we can do so with:

```
docker logs btw-server
```

## Stopping/Restarting

If we need to stop the server we can issue the following command:

```
docker stop btw-server
```

And if we wish to re-start the server we can issue the following:

```
docker start btw-server
```

## License

This project is licensed under a MIT License.