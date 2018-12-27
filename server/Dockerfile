FROM anapsix/alpine-java:8_jdk

# Install required dependencies
RUN apk update
RUN apk add curl

# Prepare the final locations
RUN mkdir /opt/server && mkdir /opt/server/world

COPY startup.sh init.sh /opt/
RUN chmod +x /opt/startup.sh /opt/init.sh

EXPOSE 25565

LABEL org.label-schema.name = "Better Than Wolves Server"
LABEL org.label-schema.description = "A Minecraft server running the Better Than Wolves mod"
LABEL org.label-schema.vcs-url = "https://github.com/rwapshott/btw-server"
LABEL org.label-schema.version = "0.1"
org.label-schema.schema-version = "1.0"

CMD ["/opt/startup.sh"]