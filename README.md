docker-openvpn
==============

Docker container for OpenVPN client/server.

[![](https://badge.imagelayers.io/phlak/openvpn-client:latest.svg)](https://imagelayers.io/?images=phlak/openvpn-client:latest 'Get your own badge on imagelayers.io')


### Running the container

Create an OpenVPN client/server configuration file named `openvpn.conf` in a directory anywhere on
your host system. You should also place your client/server certs, keys and any additional files in
this directory.

    mkdir /local/dir
    nano /local/dir/openvpn.conf

Then run the OpenVPN container and map your local config directory to a container volume:

    docker run -d -v /local/dir:/etc/openvpn --privileged --restart=always --name openvpn-client phlak/openvpn


##### Optional Arguments

`-p 1234:1234` - Map a port on the host OS to the container OS (Note: This will pass on through to
                 containers when sharing this container's network stack with the `--net` parameter)


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
