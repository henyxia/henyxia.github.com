---
linktitle: 2020 - Tutorials
weight: 150
menu:
  main:
    parent:
      GIS4 - 2020
---

Tutorials
--

### Team organization

* Everyone will have an assigned team
* Every team will have an unique ID

### Tutorials organization

* There will be multiple tutorials
* Every completed tutorial will be rewarded with points
* The point quantity will be linked to the difficulty of the tutorial
* Tutorial completion can only be validated by teachers

Tutorial 1
===

### 1 point

* Go to your team virtual machine and setup network
* The proxmox interface is available at https://jw.plil.net:8006 (user: `root`, password: as usual, method: `PAM`)
* Your virtual machine ID is your group number with your group number (ex, group 2 team4: ID=204)
* The IP to set is 10.0.1.$VM_ID
* The netmask is 255.0.0.0
* The gateway is 10.0.0.1

* You can test if you successfully set your network configuration by trying to ping Google (8.8.8.8)

* Also, you configuration needs to be reboot-proof

Tutorial 2
===

### 1 point

* Install Nginx and configure it to serve an HTML you will create in /var/www/

* Note: to install nginx, do not forget to set your `resolv.conf` file

Tutorial 3
===

### 1 point

* Install HAProxy 2.2
* Set up HAProxy to accept traffic from port 8888 and redirect it to your Nginx

* Tip: Your virtual machines are running Debian 10
* Second tip: This [website](https://haproxy.debian.net) could be useful

Tutorial 4
===

### 1 point

* Install Docker
* Pull the latest Nginx image from Docker Hub
* Copy your previous web page inside a Nginx container with `docker cp` command
* Redirect the port 8889 with HAProxy to this container

Tutorial 5
===

### 2 points

* Create a Dockerfile with Nginx and your web page
* Create an image with this Dockerfile named `web-$VM_ID:v1`
* Publish your image on the registry: 10.99.99.97

Tutorial 6
===

### 1 point

* Install Nomad
* Use it as a single master and client node ([doc](https://www.nomadproject.io/intro/getting-started/running.html))

Tutorial 7
===

### 2 points

* Create a job definition and start your container image with Nomad

Tutorial 8
===

### 3 points

* Increase your website to 3 running containers
* Configure HAProxy to use Consul service discovery
