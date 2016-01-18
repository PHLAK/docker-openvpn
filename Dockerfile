FROM alpine:3.3
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewicz.com>

# Create OpenVPN conf directory
RUN mkdir -p /vol/config

# Install OpenVPN
RUN apk add --update openvpn && rm -rf /var/cache/apk/*

# Set working directory
WORKDIR /vol/config

# Defualt run command
CMD ["openvpn", "--config", "/vol/config/openvpn.conf", "--verb", "3", "--remap-usr1", "SIGTERM"]
