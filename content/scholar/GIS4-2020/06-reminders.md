---
title: Reminders
linktitle: Some reminders
weight: 60
menu:
  main:
    parent:
      GIS4 - 2020
---

OSI layers
==

* Every network transmission is ruled by the OSI layers
* Every protocol is in one of the seven layers
* Every protocol is ruled by the IETF

---

OSI layers simplified
==

* Layer 3 (L3): Internet layer (ex: IPv4, IPv6, ICMP, ICMPv6)
* Layer 4 (L4): Transport layer (ex: TCP, UDP)
* Layer 7 (L7): Application layer (ex: DNS, HTTP, SSH)

---

IP
==

* Identifies a PC/server/VM/container on a network
* Two type: IPv4 (55.212.24.127) IPv6 (fe80::f6b3:6105:cab3:89af)
* Layer 2 protocol

---

IPv4
==

* An IP comes with a network mask (netmask) to describe its network
* All IPs inside the network are directly reachable
* All IPs outside the network maybe reachable through a gateway

```
henyxia@pdev:~ $ ip address
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: ens18: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 02:8f:c5:23:e3:63 brd ff:ff:ff:ff:ff:ff
    inet 10.2.1.12/16 brd 10.2.255.255 scope global ens18
       valid_lft forever preferred_lft forever
```

---

IPv4
==

* An IP address can be displayed as integer or binary
    * `192.168.0.12` equals `11000000.10101000.00000000.00001100`
* Netmask can also be displayed as number of significant bit
    * `255.255.255.0` equals `11111111.11111111.11111111.00000000`
    * `255.255.255.0` equals `/24`

---

IP and routes
==

* Everything inside the network can be contacted directly
    * ex: `10.2.0.0/16 dev ens18 proto kernel scope link src 10.2.1.10`
* Everything outside the network can be contacted through a gatway
    * ex: `default via 10.2.0.1 dev ens18 onlink`

```
henyxia@pdev:~ $ ip route
default via 10.2.0.1 dev ens18 onlink
10.2.0.0/16 dev ens18 proto kernel scope link src 10.2.1.10
```

---

Common networks
==

There are three kind of networks:

* Reserved (almost usable by nobody)
* Public (reachable by anyone, aka the Internet)
* Private (usable only locally, not directly reachable from Internet)
    * 10.0.0.0/8
    * 172.16.0.0/12
    * 192.168.0.0/16

---

# That's all folks!

### See you next week for the next episode!
