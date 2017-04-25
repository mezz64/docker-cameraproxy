# FROM lsiobase/mono
FROM ubuntu:latest
MAINTAINER mezz64

# set environment variables
# ARG DEBIAN_FRONTEND="noninteractive"
# ENV XDG_CONFIG_HOME="/config/xdg"

RUN \
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
 echo "deb http://download.mono-project.com/repo/debian wheezy main" \
    | tee /etc/apt/sources.list.d/mono-xamarin.list && \
 apt-get update && \
 apt-get install -yq \
    ca-certificates-mono \
    mono-complete \
    supervisor && \

# cleanup
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

RUN mkdir -p /var/log/supervisor

ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# add local files
# COPY root/ /

#Add start script
# ADD start.sh /start.sh
# RUN chmod +x /start.sh

# ports and volumes
EXPOSE 44456 44454
VOLUME /config

WORKDIR /config

# CMD [ "mono",  "--debug",  "/config/MJpegCameraProxyCmd.exe" ]
# ENTRYPOINT ["/start.sh"]
CMD ["/usr/bin/supervisord"]