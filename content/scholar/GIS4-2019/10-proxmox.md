---
title: Proxmox
weight: 110
menu:
  main:
    parent:
      GIS4 - 2019
---

Proxmox
---

Introduction
===

### What is Proxmox?

* An operating system based on Debian
* Can be installed on raw Debian
* Create and manage containers and virtual machines
* Gives tool allowing hot and cold migration of VMs
* And many other features (like user/group management, HA and so on)

---

### Easily usable through a Web UI

Four views are available:

* Server view
* Folder view 
* Storage view
* Pool view

---

### How to create a new virtual machine

* From server or folder view
* Right click on one node
* Select create a new VM

---

### The CLI

To list VMs

```
root@server:~# qm list
      VMID NAME         STATUS     MEM(MB)    BOOTDISK(GB) PID
       117 nomadnode01  running    65536      32.00        2669
       120 consul01     running    8192       32.00        19705
       125 edge01       running    4096       32.00        2734
       126 edge02       running    4096       32.00        2792
       129 broker01     running    4096       32.00        30455
       130 broker02     running    4096       32.00        43813
       131 broker03     running    4096       32.00        46862
       132 db01         running    4096       32.00        47359
       148 db02         running    2048       50.00        20171
```

---

### The CLI

To clone of VM

```
qm clone 100 105 -name db03 -full
```
