#FROM ubuntu:latest
FROM mono:4.8.0.524
MAINTAINER mezz64

#RUN \
# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
#    --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
# echo "deb http://download.mono-project.com/repo/debian wheezy main" \
#    | tee /etc/apt/sources.list.d/mono-xamarin.list && \
# apt-get update && \
# apt-get install -yq \
#    ca-certificates-mono \
#    mono-complete \
#    supervisor && \

RUN apt-get update && \
    apt-get install -yq \
    supervisor && \

# cleanup
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

RUN mkdir -p /var/log/supervisor

ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# ports and volumes
EXPOSE 44456 44454
VOLUME /config

WORKDIR /config

CMD ["/usr/bin/supervisord"]
