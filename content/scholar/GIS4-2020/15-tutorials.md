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
* The proxmox interface is available at https://jw.plil.fr:8006 (user: `root`, password: as usual, method: `PAM`)
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

Tutorial 9
===

### 1 point

* Add a route on your computer (the zabeth) to access the virtual machines directly
* Network to add is `10.0..0.0/8`
* Hop to use is `172.26.145.250`

Tutorial 10
===

### 2 points

* Reconfigure your nomad server to use the common consul (`10.99.99.96:8500`) and the common nomad server (`10.99.99.96:4646`)
* This [example](https://www.nomadproject.io/docs/configuration/consul#default) should help you to setup the consul part
* Configure `bind_addr` to you virtual machine IP
* You will need to run nomad with the following command: `nomad agent -config=/etc/nomad.d`
* Go to the common nomad `http://10.99.99.96:4646/ui/clients` and check that your VM IP is well set within the `nomad-client` service

Tutorial 11
===

### 1 point

* Create an account on this Gitlab https://gitlab.gis-virt.fr/
* Create a repo for your team in `gis2020/grp$Xteam$Y` with `$x` being your group number and `$y` your team number (ex `grp1team02`)
* Add your files to the repo: `index.html` , `Dockerfile`
* Add your nomad job definition, name it: `project.nomad`

Tutorial 12
===

This tutorial will make all your previous work deployable automatically from Gitlab.
Steps will be detailed to help you.

### 3 points

* Edit your `project.nomad` file
	* Set the job name to `web-$VMID` (ex `web-103`)
	* Set memory requierement to 128 Mo
	* Set CPU requirement to 500 MHz
        * Set count to 4
	* Set docker image to `10.99.99.97:5000/web-$VMID:${CI_COMMIT_SHORT_SHA}` (ex: `10.99.99.97:5000/web-103:${CI_COMMIT_SHORT_SHA}`)
	* Set the service name to `web-$VMID` (ex `web-103`)
	* Set the service tag and port to `web`
* Commit and push your changes
* Add the following file to your repository: (do not forget to change `$VMID`)

```
variables:
  NOMAD_ADDR: http://10.99.99.96:4646
  docker_registry: 10.99.99.97:5000
  docker_image: web-$VMID

stages:
  - build
  - deploy

build:
  stage: build
  image: docker
  tags:
    - docker
  script:
    - tag=${docker_registry}/${docker_image}:${CI_COMMIT_SHORT_SHA}
    - echo "building and pushing tag $tag"
    - docker build -t ${tag} -f Dockerfile .
    - docker push ${tag}

deploy:
  stage: deploy
  image: hendrikmaus/nomad-cli
  tags:
    - docker
  script:
    - apk add gettext
    - envsubst '${CI_COMMIT_SHORT_SHA}' < project.nomad > job.nomad
    - cat job.nomad
    - nomad validate job.nomad
    - nomad plan job.nomad || if [ $? -eq 255 ]; then exit 255; else echo "success"; fi
    - nomad run job.nomad
```

* You can check the deployment on your Gitlab repo (ex: `https://gitlab.gis-virt.fr/gis2020/grp3team01/-/jobs`)
* Once deployed, you will see your job running on the common Nomad: http://10.99.99.96:4646/ui/jobs

Tutorial 13
===

### 1 point

* Connect to `10.99.99.96`
* Edit the HAProxy configuration
	* Add your backend named `web-$VMID`
	* Add a redirection from `web-$VMID.gis-virt.fr` to your backend
	* Do not forget to validate your configuration with `haproxy -c -f /etc/haproxy.cfg`
	* Restart with `systemctl restart haproxy`
* You should now see your website by going on `https://web-$VMID.gis-virt.fr`

Tutorial 14
===

### 1 point

* Now edit your `index.html` file
* Commit and push your changes
* You should see the change on your website `https://web-$VMID.gis-virt.fr` few seconds/minutes later

Thank you for following these tutorials :)
===
