A Docker project to build the Better Than Wolves Minecraft server.

This Dockerfile requires that you have downloaded the Better Than Wolves
mod from the [official forum](http://www.sargunster.com/btwforum).

*Note:* This Dockerfile should be build by you in order to avoid
pre-compiling the binaries of either Mojangs Minecraft or the Mod authors 
licensed work. Build instructions have been provided below.

## Requirements

This project assumes a Linux/Mac style development environment. Docker
must be installed and working for this project to build.

You also need to have downloaded the Mod zip file before you can build
this project.

## Building

Once the mod zip file is downloaded, place it in the `server` folder.
Then run the `build-btw` script to build the Docker image.

This will assemble a Docker image which is tied to the specific
of the zip file provided. For example:

```
btw-server:BTWMod4-ABCFEFEb
```

## Running

To run the Docker image, simply execute the `run-btw` script. This 
will launch the most recently build image for the `btw-server` repository.

## License

This project is licensed under a MIT License.