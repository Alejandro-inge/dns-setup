# dns-setup
This repo describes how to configure a local dns server. The most part of it will be done automatically by a bash script.

## Configurations

- Create a zone file
- Setup a master dns
- Setup a slave dns

## Architecture

- Ubuntu server v25.10
- Master DNS server 10.0.4.2
- Slave DNS server 10.0.4.3
- Zones
    - MySQL 10.0.4.4
    - Apache 10.0.4.5
    - SAMBA 10.0.4.6

## Files involved

- `/etc/bind/named.conf.local` - Zone file definition
- `/etc/bind/named.conf.options` - Forwarding
- `/etc/bind/net.local.lan` Zone file configuration

## Previous steps before proceeding

- Add the DNS server IP address into the `/etc/dhcp/dhcpd.conf` option **domain-name-servers** field.
- Configure the server's static IP address
- Define your IP address-service mapping
- Configure the `net.local.lan` file as you need
- Execute `setup.bash`

## Verification

Zone file verification

    named-checkzone local.lan /etc/bind/net.local.lan

Named files verification 

    named-checkconfig local.lan /etc/bind/named.conf.local
    named-checkconfig local.lan /etc/bind/named.conf.options

Zone status

    rndc zonestatus local.lan

DNS query

    dig local.lan @IP

Dig alternative

    nslookup local.lan IP

Debug

    tail -f /var/log/syslog