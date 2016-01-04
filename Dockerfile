FROM alpine:3.3
MAINTAINER Chris Kankiewicz <Chris@ChrisKankiewicz.com>

# Create OpenVPN conf directory
ENV VPN_CONF_DIR /etc/openvpn
RUN mkdir -p ${VPN_CONF_DIR}

# Install OpenVPN
RUN apk add --update ca-certificates openvpn \
    && rm -rf /var/cache/apk/*

# Expose ports
EXPOSE 443 943 1194/udp

# Set working directory
WORKDIR ${VPN_CONF_DIR}

# Defualt run command
CMD openvpn --config ${VPN_CONF_DIR}/openvpn.conf --verb 3
