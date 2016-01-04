docker-openvpn
==============

Docker container for OpenVPN client/server.

[![](https://badge.imagelayers.io/phlak/openvpn-client:latest.svg)](https://imagelayers.io/?images=phlak/openvpn-client:latest 'Get your own badge on imagelayers.io')

This container will provide an OpenVPN tunnel for other containers to utilize via Docker's shared
networking stack (i.e. `--net container:[NAME]`).


### Running the container

Place your OpenVPN client/server configuration file in a directory on your host file system
(i.e. `/srv/openvpn`) with the name `openvpn.conf`. You should also place your client/server certs,
keys and any additional files required in this directory.

Next run the OpenVPN container and map your local config directory (`/srv/openvpn`) to the container
config directory (`/etc/openvpn`):

    docker run -d -v /srv/openvpn:/etc/openvpn --privileged --restart=always --name openvpn-client phlak/openvpn

Now you can start up your container with a shared network stack to the OpenVPN container:

    docker run -d --net container:openvpn-client --name container-name ubuntu

This container will now be reliant on the OpenVPN container's network stack for network access.


##### Optional Arguments

`-p 1234:1234` - Map a port on the host OS to the OpenVPN container. This will pass ports through to
                 containers that share the OpenVPN container's network stack (i.e. When started with
                 the `--net container:openvpn-client` parameter).


-----

**Copyright (c) 2015 Chris Kankewicz <Chris@ChrisKankiewicz.com>**

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
