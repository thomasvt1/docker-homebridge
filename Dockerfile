FROM v1k0d3n/homebridge
MAINTAINER Dmitry Kireev <dmitry@kireev.co>


##################################################
# Install homebridge extra plugins               #
##################################################

RUN npm install -g \
homebridge-homeassistant \
homebridge-foscam --unsafe-perm

##################################################
# Start                                          #
##################################################

VOLUME /root/.homebridge
EXPOSE 5353 51826
CMD ["/root/run.sh"]
