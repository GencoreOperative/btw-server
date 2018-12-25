A Docker project to build the Better Than Wolves Minecraft server.

This Dockerfile requires that you have downloaded the Better Than Wolves
mod from the [official forum](http://www.sargunster.com/btwforum).

*Note:* This Dockerfile should be build by you in order to avoid
pre-compiling the binaries of either Mojangs Minecraft or the Mod authors 
licensed work. As such build instructions have been provided below.

## Building

Once the mod zip file is downloaded, place it in the `server` folder.
Then run the `build-btw` script to build the Docker image.

This will assemble a Docker image which is tied to the specific
of the zip file provided.

## Running

To run the Docker image, simply execute the `run-btw` script.