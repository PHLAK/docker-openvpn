FROM alpine:3.3
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewicz.com>

# Create OpenVPN conf directory
RUN mkdir -p /etc/openvpn

# Install OpenVPN
RUN apk add --update ca-certificates openvpn \
    && rm -rf /var/cache/apk/*

# Set working directory
WORKDIR /etc/openvpn

# Defualt run command
CMD ["openvpn", "--config", "/etc/openvpn/openvpn.conf", "--remap-usr1", "SIGTERM", "--verb", "3"]
