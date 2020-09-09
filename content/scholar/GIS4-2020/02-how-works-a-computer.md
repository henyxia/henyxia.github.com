---
title: How works a computer
linktitle: A computer in details
weight: 20
menu:
  main:
    parent:
      GIS4 - 2020
---

How computer really works
==

* BIOS (or UEFI) received power on signal
* BIOS initialize all direct peripherals
* BIOS looks for a bootable device
* BIOS switch to bootloader
* Bootloader loads kernel
* Kernel initialize everything
* Kernel switch to userland (`init`, `systemd-init`, `wininit.exe`)
* Init starts service manager (`systemd`, `openrc`, `svchost.exe`)
* Service manager starts real software (`nginx`, `sshd`, `kde4`)

---

How computer really works
==

### Process tree

```
henyxia@yggdrasil:~ pstree
systemd─┬─ModemManager───2*[{ModemManager}]
        ├─NetworkManager───2*[{NetworkManager}]
        ├─alsactl
        ├─auditd───{auditd}
        ├─avahi-daemon───avahi-daemon
        ├─bash───firefox─┬─RDD Process───3*[{RDD Process}]
        │                ├─4*[Web Content───42*[{Web Content}]]
        │                ├─Web Content───39*[{Web Content}]
        │                ├─2*[Web Content───41*[{Web Content}]]
        │                ├─WebExtensions───32*[{WebExtensions}]
        │                └─80*[{firefox}]
        ├─bash───pavucontrol───3*[{pavucontrol}]
        ├─bash───spotify─┬─spotify───spotify───11*[{spotify}]
        │                ├─2*[spotify───4*[{spotify}]]
        │                └─29*[{spotify}]
```
