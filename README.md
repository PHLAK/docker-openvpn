docker-openvpn
==============

<p align="center">
    <a href="http://microbadger.com/#/images/phlak/openvpn" alt="Microbadger"><img src="https://images.microbadger.com/badges/image/phlak/openvpn.svg"></a>
    <a href="https://ln.phlak.net/join-slack"><img src="https://img.shields.io/badge/Join_our-Slack-611f69.svg" alt="Join our"></a>
    <a href="https://github.com/users/PHLAK/sponsorship"><img src="https://img.shields.io/badge/Become_a-Sponsor-cc4195.svg" alt="Become a Sponsor"></a>
    <a href="https://patreon.com/PHLAK"><img src="https://img.shields.io/badge/Become_a-Patron-e7513b.svg" alt="Become a Patron"></a>
    <a href="https://paypal.me/ChrisKankiewicz"><img src="https://img.shields.io/badge/Make_a-Donation-006bb6.svg" alt="One-time Donation"></a>
</p>

<p align="center">
    Docker image for <a href="https://openvpn.net">OpenVPN</a> client/server.
</p>

---

This container can run as an OpenVPN server or as an OpenVPN client and provide a VPN tunnel for
other containers to utilize via Docker's shared networking stack (i.e. `--net container:[NAME]`).

Running the Container
---------------------

Place your OpenVPN client/server configuration file in a directory on your host file system
(i.e. `/srv/openvpn`) with the name `openvpn.conf`. You should also place your client/server certs,
keys and any additional files required in this directory.


#### Running as an OpenVPN server

Run the OpenVPN container and map your local config directory (`/srv/openvpn`) to the container
config directory (`/vol/config`) and map ports to your host OS:

    docker run -d -v /srv/openvpn:/vol/config -p 443:443 -p 943:943 -p 1194:1194/udp --privileged --name openvpn-server phlak/openvpn --server [NETWORK] [NETMASK]


#### Running as an OpenVPN client

Run the OpenVPN container and map your local config directory (`/srv/openvpn`) to the container
config directory (`/vol/config`):

    docker run -d -v /srv/openvpn:/vol/config --privileged --name openvpn-client phlak/openvpn

Now you can start up another container with a shared network stack to the OpenVPN container:

    docker run -d --net container:openvpn-client --name container-name alpine

This container will now be reliant on the OpenVPN container's network stack for network access.


#### Optional 'docker run' Arguments

`-p 1234:1234` - Map a port on the host OS to the OpenVPN container. When running as a client this
                 will pass ports through to containers that share the OpenVPN container's network
                 stack (i.e. When ran with the `--net container:openvpn-client` parameter).

`--restart always` - Always restart the container regardless of the exit status. See the Docker
                     [restart policies](https://goo.gl/OI87rA) for additional details.


Troubleshooting
---------------

When running a client container, if you are having trouble making a connection and `docker logs`
shows `Initialization Sequence Completed` without indicatiing any problems try manually setting your
container's DNS servers by adding `--dns 1.1.1.1 --dns 1.0.0.1` to your run command. Once your
container is running check you DNS name servers with:

    docker exec transmission-vpn cat /etc/resolv.conf

For general help and support join our [Slack Workspace](https://ln.phlak.net/join-slack).

Please report bugs to the [GitHub Issue Tracker](https://github.com/PHLAK/docker-openvpn/issues).


Copyright
---------

This project is licensed under the [MIT License](https://github.com/PHLAK/docker-openvpn/blob/master/LICENSE).
