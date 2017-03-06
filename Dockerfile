FROM node:7
MAINTAINER Dmitry Kireev <dmitry@kireev.co>

##################################################
# Set environment variables                      #
##################################################

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

##################################################
# Install tools                                  #
##################################################

RUN apt-get update && \
    apt-get install -y \
    locales \
    python \
    build-essential \
    make \
    g++ \
    libavahi-compat-libdnssd-dev \
    libkrb5-dev

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
