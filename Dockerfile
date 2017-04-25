# FROM lsiobase/mono
FROM ubuntu:latest
MAINTAINER mezz64

# set environment variables
ARG DEBIAN_FRONTEND="noninteractive"
# ENV XDG_CONFIG_HOME="/config/xdg"

RUN \
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
 echo "deb http://download.mono-project.com/repo/debian wheezy main" \
    | tee /etc/apt/sources.list.d/mono-xamarin.list && \
 apt-get update && \
 apt-get install -yq \
#    --no-install-recommends \
#    --no-install-suggests \
    bzip2 \
    ca-certificates-mono \
    libcurl4-openssl-dev \
#    mediainfo \
    mono-complete \
#    mono-devel \
#    mono-vbnc \
#    python \
#    sqlite3 \
    unzip && \

# cleanup
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 44456 44454
VOLUME /config

CMD [ "mono",  "--debug",  "/config/MJpegCameraProxyCmd.exe" ]