FROM alpine:3.3
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewicz.com>

# Create OpenVPN conf directory
RUN mkdir -p /vol/config

# Install OpenVPN
RUN apk add --update openvpn && rm -rf /var/cache/apk/*

# Workaround to fix broken down script (see: http://goo.gl/nTfYHR)
COPY files/down.sh /etc/openvpn/down.sh
RUN chmod +x /etc/openvpn/down.sh

# Set working directory
WORKDIR /vol/config

# Defualt entrypoint and run command
ENTRYPOINT ["openvpn", "--config", "/vol/config/openvpn.conf", "--verb", "3", "--remap-usr1", "SIGTERM"]
CMD ["--script-security", "2", "--up", "/etc/openvpn/up.sh", "--down", "/etc/openvpn/down.sh"]
