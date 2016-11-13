FROM v1k0d3n/homebridge
MAINTAINER Dmitry Kireev <dmitry@kireev.co>


##################################################
# Install homebridge extra plugins               #
##################################################

RUN npm install -g homebridge-homeassistant

##################################################
# Start                                          #
##################################################

USER root
RUN mkdir -p /var/run/dbus

ADD image/run.sh /root/run.sh

EXPOSE 5353 51826
CMD ["/root/run.sh"]
