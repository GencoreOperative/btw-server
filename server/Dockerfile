FROM anapsix/alpine-java:8_jdk

# Install required dependencies
RUN apk update
RUN apk --no-cache add curl

# Create non-root user for server
RUN addgroup -g 2000 server \
  && adduser -D -u 2001 -G server server

# Prepare the folder locations
RUN mkdir /opt/server && mkdir /opt/server/world
RUN chown server:server /opt/server && chmod 777 /opt/server/world

COPY startup.sh init.sh /opt/
RUN chmod +x /opt/startup.sh /opt/init.sh
RUN chown server:server /opt/startup.sh && chown server:server /opt/init.sh

EXPOSE 25565

ARG VERSION
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name = "Better Than Wolves Server" \
  org.label-schema.description = "A Minecraft server running the Better Than Wolves mod" \
  org.label-schema.version = "${VERSION}" \
  org.label-schema.build-date=${BUILD_DATE} \
  org.label-schema.vcs-ref=${VCS_REF} \
  org.label-schema.vcs-url="https://github.com/rwapshott/btw-server" \
  org.label-schema.schema-version = "1.0"

USER server
CMD ["/opt/startup.sh"]