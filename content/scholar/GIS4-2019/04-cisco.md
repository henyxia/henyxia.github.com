---
title: Cisco presentation
weight: 50
menu:
  main:
    parent:
      GIS4 - 2019

---

# Now let's do this on real equipments!

---

Network equipments
===

### Definition

* Like a desktop computer, but with signigicant differences
* CPUs with lower capacity
* Some dedicated chips to handle the data flow
* Specific operating systems (Cisco IOS)
* No screens, no USB but a lot of ports
* Configurable via serial or SSH

---

# Some basics

With an example:

```
my-server$ ssh admin@router
Password:
router>enable
Password:
router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
router(config)#exit
router#write
Building configuration...
[OK]
router#reload
Proceed with reload? [confirm]
```

---

# Some basics

Setting a password:

```
router>enable
router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
router(config)#enable password glopglop
router(config)#exit
router#write
Building configuration...
[OK]
router#reload
Proceed with reload? [confirm]
```

See the running configuration:

```
router>show running-config
```

Setting a cyphered password:

```
router(config)#enable secret glopglop
```

---

# Some basics

Setting a password for SSH:

```
router>enable
router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z
router(config)#hostname router
router(config)#aaa new-model
router(config)#username admin privilege 15 password glopglop
router(config)#! ou pour plus de sécurité :
router(config)#username admin privilege 15 secret glopglop
router(config)#ip domain-name deule.net
router(config)#crypto key generate rsa
router(config)#line vty 0 15
router(config-line)#transport input ssh
router(config-line)#exit
router(config)#exit
```

---

# Some basics

Listing interfaces:

```
router>show interfaces summary
*: interface is up
IHQ: pkts in input hold queue     IQD: pkts dropped from input queue
OHQ: pkts in output hold queue    OQD: pkts dropped from output queue
RXBS: rx rate (bits/sec)          RXPS: rx rate (pkts/sec)
TXBS: tx rate (bits/sec)          TXPS: tx rate (pkts/sec)
TRTL: throttle count

 Interface                   IHQ       IQD       OHQ       OQD      RXBS      RXPS      TXBS      TXPS      TRTL
----------------------------------------------------------------------------------------------------------------
 FastEthernet1                 0         0         0         0         0         0         0         0         0
 TenGigabitEthernet1/1         0         0         0         0  22673000     37912 2758660000    228470         0
 TenGigabitEthernet1/2         0         0         0   2276353  44854000      7409  29491000      6402         0
 TenGigabitEthernet1/3         0         0         0         0 145019000     17745  15431000     10343         0
...
```

---

# Some basics

Show running configuration of an interface:

```
router#show running-config interface TenGigabitEthernet1/19
Building configuration...

Current configuration : 169 bytes
!
interface TenGigabitEthernet1/19
 description baie B12
 switchport trunk native vlan 464
 switchport trunk allowed vlan 262,263,278,463,464,762,763
 switchport mode trunk
end
```

---

# Router configuration

Let's assign an IP in our router:

```
router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
router(config)#interface GigabitEthernet0/1
router(config-if)#ip address 192.168.0.1 255.255.255.0
router(config-if)#exit
router(config)#exit
```

And start its routing:

```
router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
router(config)#ip routing
router(config)#exit
router#show ip route
```

---

# Router configuration

Let's assign a new VLAN!

### Method 1: sub interfaces

```
router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
router(config)#interface GigabitEthernet0/1.2
router(config-subif)#encapsulation dot1Q 2
router(config-subif)#ip address 192.168.2.1 255.255.255.0
router(config-subif)#exit
router(config)#exit
```

### Method 2: VLAN interfaces

```
router#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
router(config)#interface vlan2
router(config-if)#ip address 192.168.2.1 255.255.255.0
router(config-if)#exit
router(config)#exit
```

---

# Switch configuration

Let's assign a new VLAN!

### access mode

```
switch#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
switch(config)#interface gigabitEthernet0/7
switch(config-if)#switchport mode access
switch(config-if)#switchport access vlan 2
switch(config-if)#exit
```

### trunk mode

```
switch#configure terminal
Enter configuration commands, one per line.  End with CNTL/Z.
switch(config)#interface fastEthernet0/1
switch(config-if)#switchport mode trunk
switch(config-if)#switchport trunk allowed vlan 262,464,762
switch(config-if)#switchport trunk native vlan 264
switch(config-if)#exit
```
