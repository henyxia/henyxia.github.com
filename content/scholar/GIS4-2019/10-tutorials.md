---
title: Tutorials
weight: 110
menu:
  main:
    parent:
      GIS4 - 2019
---

Tutorials
---

Introduction
===

### Team organization

* Everyone will have an assigned team
* Every team will have an unique ID

### Tutorials organization

* There will be multiple tutorials
* Every completed tutorial will be rewarded with points
* The point quantity will be linked to the difficulty of the tutorial
* Tutorial completion can only be validated by teachers

### Final exam notation

* The final exam will be a written test
* It will contain everything seen during course and tutorials
* It will account for 50% of your final score

### Final score

Your final score will be composed of:

* `1` point for assiduity
* `8` points based on how many were earned during tutorials
* `10` points from the final test
* `1` point of excellence, left to the discretion of the teachers

---

Tutorial 1
===

#### 1 point

Install Apache2 on your computer and display a webpage showing your team number.

Note: You can add any image or funny thing to make your page more specific.

---

Tutorial 2
===

#### 1 point

* Install [Docker](https://docs.docker.com/install/linux/docker-ce/debian/) on your computer
* Pull Apache from Docker Hub
* Start Apache
* Copy your webpage inside your container

---

Tutorial 3
===

#### 2 point

* Create a Dockerfile to build your website with your team's page
* Build the image with the tag name being `team-$UID-web` (`$UID` being your team unique identifier)
* Start a new container with your image

---

Tutorial 4
===

#### 2 point

* Install HAProxy
* Configure it to have a frontend named `http-in` listening on port 80
* Configure it to have stats exposed on port 81
* Configure it to have a backend named `team-$UID-backend` listening on your previous container

---

Tutorial 5
===

### 1 point

* Install [Nomad](https://www.nomadproject.io/)
* Use it as a single master and client node ([some doc here](https://www.nomadproject.io/intro/getting-started/running.html))

---

Tutorial 6
===

### 2 point

* Create a job definition and start your container with Nomad

---

Tutorial 7
===

### 3 point

* Increase your website to 3 running containers
* Configure HAProxy to use Consul service discovery

---

Tutorial 8
===

### 1 point

* Create a virtual machine on the student server
* Based on Debian 10
* With proxmox interface `https://chassiron.insecserv.deule.net:8006`
