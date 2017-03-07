FROM node:7-alpine
MAINTAINER Thomas <thomasvt@me.com>

##################################################
# Install tools                                  #
##################################################

RUN apk add --update \
    libffi-dev openssl-dev \
    avahi-dev \
    python \
    bash \
    make \
    g++



##################################################
# Install homebridge                             #
##################################################

RUN npm install -g homebridge \
    homebridge-homeassistant \
    --unsafe-perm

##################################################
# Start                                          #
##################################################

USER root
RUN mkdir -p /var/run/dbus

ADD start.sh /root/start.sh

VOLUME /root/.homebridge
EXPOSE 5353 51826
CMD ["/root/start.sh"]
