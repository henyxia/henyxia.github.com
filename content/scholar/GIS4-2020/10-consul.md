---
linktitle: Consul reference
weight: 100
menu:
  main:
    parent:
      GIS4 - 2020
---

Consul
=

What is Consul?
===

* Lightweight K/V service registry tool written in Go by HashiCorp
* Available on most Unix distributions
* Allow to register service and key

---

Consul example
===

![Consul example](/consul.png)

---

Consul and DNS
===

```
$ dig @127.0.0.1 -p 8600 _my-webapp._web.service.consul SRV

; <<>> DiG 9.11.5-P4-5.1-Debian <<>> @10.41.7.83 -p 8600 _my-webapp._web.service.consul SRV
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 51598
;; flags: qr aa rd; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 9
;; WARNING: recursion requested but not available

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;_my-webapp._web.service.consul. IN    SRV

;; ANSWER SECTION:
_my-webapp._web.service.consul. 0 IN   SRV 1 1 30820 my-server01.node.pardc2.consul.
_my-webapp._web.service.consul. 0 IN   SRV 1 1 24464 my-server02.node.pardc2.consul.

;; ADDITIONAL SECTION:
my-server01.node.pardc2.consul. 0 IN A 10.0.0.1
my-server01.node.pardc2.consul. 0 IN TXT "consul-network-segment="
my-server02.node.pardc2.consul. 0 IN A 10.0.0.2
my-server02.node.pardc2.consul. 0 IN TXT "consul-network-segment="

;; Query time: 8 msec
;; SERVER: 10.41.7.83#8600(10.41.7.83)
;; WHEN: Tue Sep 17 02:13:24 CEST 2019
;; MSG SIZE  rcvd: 520
```
