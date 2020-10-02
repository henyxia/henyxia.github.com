---
linktitle: Major network commands
weight: 70
menu:
  main:
    parent:
      GIS4 - 2020
---

Network interface
==

### List interfaces

~~~bash
root@my-server:~# ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 0c:c4:7b:84:5f:2e brd ff:ff:ff:ff:ff:ff
3: eno2: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/ether 0c:c4:7b:84:5f:3e brd ff:ff:ff:ff:ff:ff
~~~

### Start an interface

~~~bash
ip link set eno1 up
~~~

### Change a MAC address

~~~bash
ip link set eno1 address 00:11:22:33:44:55
~~~

IP addresses
==

### List IPs

~~~bash
root@my-server:~# ip address show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 0c:c4:7b:84:5f:2e brd ff:ff:ff:ff:ff:ff
    inet 163.172.67.112/24 brd 163.172.67.255 scope global eno1
       valid_lft forever preferred_lft forever
    inet6 fe80::ec4:7aff:fe84:5d3e/64 scope link
       valid_lft forever preferred_lft forever
3: eno2: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 0c:c4:7b:84:5f:3e brd ff:ff:ff:ff:ff:ff
~~~

### Add an IP

~~~bash
ip address add dev eno2 192.168.0.42/24
~~~

### Remove an IP

~~~bash
ip address del dev eno2 192.168.0.42/24
~~~

IP routes
==

### List routes

~~~bash
root@my-server:~# ip route show
default via 163.172.67.1 dev eno1
163.172.67.0/24 dev eno1 proto kernel scope link src 163.172.67.112
~~~

### Add route

~~~bash
ip route add 192.168.0.0/24 dev eno2
ip route add 192.168.100.0/24 via 192.168.0.1
ip route add default via 192.168.0.254
~~~

### Remove route

~~~bash
ip route del 192.168.100.0/24
~~~

Network persistence
==

(Under Debian-based operating systems)

### network-manager

* a helper for beginners
* will mostly conflict with our objectives
* not on any production grade server

### networking

`/etc/network/interfaces`

~~~bash
source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback
~~~

`/etc/network/interfaces.d/eno1`
~~~bash
allow-hotplug eno1
iface eno1 inet dhcp
~~~

`/etc/network/interfaces.d/eno2`
~~~bash
allow-hotplug eno1
iface eno1 inet static
  address 192.168.0.10
  netmask 255.255.255.0
  gateway 192.168.0.254
~~~

---

Resolving domains
===

Configuration file available in `/etc/resolv.conf`

```
root@my-server:~# cat /etc/resolv.conf
nameserver 62.210.16.6
nameserver 62.210.16.7
```
