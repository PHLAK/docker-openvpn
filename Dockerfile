FROM alpine:3.3
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewicz.com>

# Create OpenVPN conf directory
RUN mkdir -p /etc/config

# Install OpenVPN
RUN apk add --update openvpn && rm -rf /var/cache/apk/*

# Set working directory
WORKDIR /etc/config

# Defualt run command
CMD ["openvpn", "--config", "/etc/config/openvpn.conf", "--verb", "3", "--remap-usr1", "SIGTERM", \
     "--script-security", "2", "--up", "/etc/openvpn/up.sh", "--down-pre", "/etc/openvpn/down.sh"]
