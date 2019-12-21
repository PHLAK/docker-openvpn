FROM alpine:3.11
LABEL maintainer="Chris Kankiewicz <Chris@ChrisKankiewicz.com>"

# Define OpenVPN version
ARG OVPN_VERSION=2.4.7-r1

# Create OpenVPN conf directory
RUN mkdir -p /vol/config

# Install OpenVPN
RUN apk add --update openvpn=${OVPN_VERSION} && rm -rf /var/cache/apk/*

# Set working directory
WORKDIR /vol/config

# Defualt entrypoint and run command
ENTRYPOINT ["openvpn", "--config", "/vol/config/openvpn.conf", "--verb", "3", "--remap-usr1", "SIGTERM"]
CMD ["--script-security", "2", "--up", "/etc/openvpn/up.sh", "--down", "/etc/openvpn/down.sh"]
