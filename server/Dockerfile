FROM anapsix/alpine-java:8_jdk

# Install required dependencies
RUN apk update
RUN apk add curl

# Prepare the final locations
RUN mkdir /opt/server && mkdir /opt/server/world

COPY startup.sh init.sh /opt/
RUN chmod +x /opt/startup.sh /opt/init.sh

EXPOSE 25565

LABEL NAME = "Better Than Wolves Server"
LABEL VERSION = "0.1"

CMD ["/opt/startup.sh"]