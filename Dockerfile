FROM lsiobase/mono
MAINTAINER mezz64

# set environment variables
ARG DEBIAN_FRONTEND="noninteractive"
ENV XDG_CONFIG_HOME="/config/xdg"

# add cameraproxy repository

# install packages
 apt-get update

# cleanup
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 44456, 44454
VOLUME /config
