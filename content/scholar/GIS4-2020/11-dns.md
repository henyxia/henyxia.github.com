---
linktitle: DNS
weight: 110
menu:
  main:
    parent:
      GIS4 - 2020
---

# DNS

DNS record types
==

* A: Host address
* AAAA: IPv6 host address
* ALIAS: Auto resolved alias
* CNAME: Canonical name for an alias
* MX: Mail eXchange
* NS: Name Server
* TXT: text field

Common command
==

```
$ dig www.google.fr

; <<>> DiG 9.11.13-RedHat-9.11.13-3.fc31 <<>> www.google.fr
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 47305
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;www.google.fr.         IN  A

;; ANSWER SECTION:
www.google.fr.      23  IN  A   216.58.198.195

;; Query time: 8 msec
;; SERVER: 192.168.255.10#53(192.168.255.10)
;; WHEN: Mon Sep 21 22:19:29 CEST 2020
;; MSG SIZE  rcvd: 58


```

Short command
==

```
henyxia@yggdrasil:~ dig +short www.google.fr
216.58.198.195
```
