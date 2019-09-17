---
title: Sys admin
weight: 60
menu:
  main:
    parent:
      GIS4 - 2019
---

System administration
---

What is `apt-get`?
===

* Package manager
* Replaced by `apt` in recent distributions
* Allow to install and maintain softwares

---

APT basics
===

### Install a package

```
$ apt install apache2
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
  hddtemp node-normalize.css python3-bottle python3-influxdb python3-netifaces python3-ply python3-psutil python3-pycryptodome python3-pysmi python3-pysnmp4 python3-pystache
Use 'apt autoremove' to remove them.
The following additional packages will be installed:
  apache2-bin apache2-data apache2-utils libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap
Suggested packages:
  apache2-doc apache2-suexec-pristine | apache2-suexec-custom
The following NEW packages will be installed:
  apache2 apache2-bin apache2-data apache2-utils libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap
0 upgraded, 8 newly installed, 0 to remove and 157 not upgraded.
Need to get 2,189 kB of archives.
After this operation, 7,567 kB of additional disk space will be used.
Do you want to continue? [Y/n]
```

---

APT basics
===

### Remove a package

```
$ apt remove --purge nginx
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
  hddtemp node-normalize.css python3-bottle python3-influxdb python3-netifaces python3-ply python3-psutil python3-pycryptodome python3-pysmi python3-pysnmp4 python3-pystache
Use 'apt autoremove' to remove them.
The following packages will be REMOVED:
  nginx*
0 upgraded, 0 newly installed, 1 to remove and 157 not upgraded.
After this operation, 100 kB disk space will be freed.
Do you want to continue? [Y/n]
```
