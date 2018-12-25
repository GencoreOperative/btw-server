FROM anapsix/alpine-java:8_jdk

# Install required dependencies
RUN apk update
RUN apk add curl jq

# The server needs to be build with a version of the Mod binary
ARG VERSION

# Prepare the final locations
RUN mkdir /opt/server && mkdir /opt/server/world

# Unpack the mod to a temporary folder
RUN mkdir /tmp/mod
COPY ${VERSION}.zip /tmp/mod
RUN cd /tmp/mod && \
  unzip ${VERSION}.zip && \
  rm ${VERSION}.zip

# Download and unpack the 1.5.2 Minecraft Server
RUN mkdir /tmp/server && \
  cd /tmp/server && \
  curl -# -O https://s3.amazonaws.com/Minecraft.Download/versions/1.5.2/minecraft_server.1.5.2.jar && \
  unzip minecraft_server.1.5.2.jar && \
  rm minecraft_server.1.5.2.jar

# Copy in the SERVER-JAR contents over the top of the 1.5.2 server
RUN cd /tmp/server && cp -r /tmp/mod/MINECRAFT_SERVER-JAR/* .

# Build a new Minecraft server which includes the Mod class files
RUN cd /tmp/server && \
  jar cvfe minecraft_server.jar net.minecraft.server.MinecraftServer * && \
  mv minecraft_server.jar /opt/server/minecraft_server.jar

# Copy the BTW Config
RUN cp /tmp/mod/BTWConfig.txt /opt/server

# Cleanup the Temporary folder
RUN rm -rf /tmp/mod && rm -rf /tmp/server

COPY startup.sh /opt
RUN chmod +x /opt/startup.sh

EXPOSE 25565

LABEL NAME = "Better Than Wolves Server"
LABEL VERSION = "${VERSION}"
LABEL RUN = "docker run -ti -p 25565:25565 --mount source=BetterThanWolves,target=/opt/server/world btw-server:${VERSION}"

CMD ["/opt/startup.sh"]