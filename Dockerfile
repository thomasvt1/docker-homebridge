FROM mhart/alpine-node
MAINTAINER Thomas <thomasvt@me.com>

##################################################
# Set environment variables                      #
##################################################

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

##################################################
# Install tools                                  #
##################################################

RUN apk add --update \
    linux-headers \
    g++ \
    build-base \
    libffi-dev openssl-dev \
    avahi-compat-libdns_sd



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
