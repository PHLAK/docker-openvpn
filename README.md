docker-openvpn
==============

Docker image for OpenVPN client/server.

[![](https://badge.imagelayers.io/phlak/openvpn:latest.svg)](https://imagelayers.io/?images=phlak/openvpn:latest 'Get your own badge on imagelayers.io')

This container can run as an OpenVPN server or as an OpenVPN client and provide a VPN tunnel for
other containers to utilize via Docker's shared networking stack (i.e. `--net container:[NAME]`).


### Running the container

Place your OpenVPN client/server configuration file in a directory on your host file system
(i.e. `/srv/openvpn`) with the name `openvpn.conf`. You should also place your client/server certs,
keys and any additional files required in this directory.


##### Running as an OpenVPN server

Run the OpenVPN container and map your local config directory (`/srv/openvpn`) to the container
config directory (`/vol/config`) and map ports to your host OS:

    docker run -d -v /srv/openvpn:/vol/config -p 443:443 -p 943:943 -p 1194:1194/udp --privileged --name openvpn-server phlak/openvpn


##### Running as an OpenVPN client

Run the OpenVPN container and map your local config directory (`/srv/openvpn`) to the container
config directory (`/vol/config`):

    docker run -d -v /srv/openvpn:/vol/config --privileged --name openvpn-client phlak/openvpn

Now you can start up another container with a shared network stack to the OpenVPN container:

    docker run -d --net container:openvpn-client --name container-name alpine

This container will now be reliant on the OpenVPN container's network stack for network access.


##### Optional 'docker run' Arguments

`-p 1234:1234` - Map a port on the host OS to the OpenVPN container. When running as a client this
                 will pass ports through to containers that share the OpenVPN container's network
                 stack (i.e. When ran with the `--net container:openvpn-client` parameter).

`--restart always` - Always restart the container regardless of the exit status. See the Docker
                     [restart policies](https://goo.gl/OI87rA) for additional details.


### Troubleshooting

When running a client container, if you are having trouble making a connection and `docker logs`
shows `Initialization Sequence Completed` without indicatiing any problems try manually setting your
container's DNS servers by adding `--dns 8.8.8.8 --dns 8.8.4.4` to your run command. Once your
container is running check you DNS name servers with:

    docker exec transmission-vpn cat /etc/resolv.conf


-----

**Copyright (c) 2016 Chris Kankewicz <Chris@ChrisKankiewicz.com>**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
