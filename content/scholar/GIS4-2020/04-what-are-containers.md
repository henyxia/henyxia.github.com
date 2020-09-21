---
title: What is virtualization
linktitle: Container details
weight: 40
menu:
  main:
    parent:
      GIS4 - 2020
---

What is a container
==

* A container is an archive
* It contains the minimal requirement to run one software
* The process is isolated (only see itself) with the help of the host kernel

---

What are namespaces
==

* Namespaces are an isolation method given by the kernel
* Different kind of namespaces exists (mnt, pid, net, ipc, uts, user, ...)
* Way lighter than a full virtualization
