---
title: Docker
weight: 70
menu:
  main:
    parent:
      GIS4 - 2019
---

What is Docker?
===

* Isolation technology allowing to run a software within the same kernel as the host
* A separated process namespace is created for this purpose
* Docker run images, which are a full snapshot of applications (with their dependencies if needed)
* Images can be ran anywhere, no matter the operating system used
* Many base images have already been build by the community and hosted in Docker Hub

---

Docker basics
===

### Pull an image

```
$ docker pull nginx:latest
latest: Pulling from library/nginx
b8f262c62ec6: Pull complete
a6639d774c21: Pull complete
22a7aa8442bf: Pull complete
Digest: sha256:9688d0dae8812dd2437947b756393eb0779487e361aa2ffbc3a529dca61f102c
Status: Downloaded newer image for nginx:latest
```

---

Docker basics
===

### Start an image detached

```
$ docker run -it nginx:latest
# detach with ^C-P ^C-Q
```

### Start an image attached

```
$ docker run -d nginx:latest
39a0263258f66217fc751aeb799b586d9d14b709f6d2a5dbd502afaa7e89b636
```

---

Docker basics
===

### List containers

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
b9568988ad7a        nginx:latest        "nginx -g 'daemon of…"   3 minutes ago       Up 3 minutes        80/tcp              agitated_feynman
39a0263258f6        nginx:latest        "nginx -g 'daemon of…"   4 minutes ago       Up 4 minutes        80/tcp              suspicious_bardeen
```
---

Docker basics
===

### Show logs of a container

```
$ docker logs 309fdd3451a9
Initializing Gerrit site ...
Generating SSH host key ... rsa... ed25519... ecdsa 256... ecdsa 384... ecdsa 521... done
Initialized /var/gerrit
Reindexing projects:    100% (2/2)
Reindexed 2 documents in projects index in 0.3s (7.4/s)
[2019-09-11 13:27:14,517] [main] INFO  com.google.gerrit.server.git.LocalDiskRepositoryManager : Defaulting core.streamFileThreshold to 866m
[2019-09-11 13:27:15,890] [main] INFO  com.google.gerrit.server.cache.h2.H2CacheFactory : Enabling disk cache /var/gerrit/cache
[2019-09-11 13:27:16,091] [main] INFO  com.google.gerrit.server.git.WorkQueue : Adding metrics for 'WorkQueue' queue
[2019-09-11 13:27:16,108] [main] INFO  com.google.gerrit.server.git.WorkQueue : Adding metrics for 'Index-Interactive' queue
[2019-09-11 13:27:16,117] [main] INFO  com.google.gerrit.server.git.WorkQueue : Adding metrics for 'Index-Batch' queue
[2019-09-11 13:27:16,178] [main] INFO  com.google.gerrit.server.git.WorkQueue : Adding metrics for 'ReceiveCommits' queue
[2019-09-11 13:27:16,179] [main] INFO  com.google.gerrit.server.git.WorkQueue : Adding metrics for 'SendEmail' queue
[2019-09-11 13:27:16,259] [main] INFO  com.google.gerrit.server.rules.PrologEnvironment : reductionLimit: 100000, compileLimit: 1000000
[2019-09-11 13:27:16,833] [main] INFO  com.google.gerrit.server.plugins.PluginLoader : Loading plugins from /var/gerrit/plugins
[2019-09-11 13:27:16,908] [main] INFO  com.google.gerrit.server.plugins.PluginLoader : Loaded plugin avatars-gravatar, version 381fc84a89
[2019-09-11 13:27:16,941] [main] INFO  com.google.gerrit.server.plugins.PluginLoader : Loaded plugin codemirror-editor, version v3.0.1
[2019-09-11 13:27:16,966] [main] INFO  com.google.gerrit.server.plugins.PluginLoader : Loaded plugin commit-message-length-validator, version v3.0.1
[2019-09-11 13:27:16,995] [main] INFO  com.google.gerrit.server.plugins.PluginLoader : Loaded plugin delete-project, version v3.0.1
[2019-09-11 13:27:17,026] [main] INFO  com.google.gerrit.server.plugins.PluginLoader : Loaded plugin download-commands, version v3.0.1
[2019-09-11 13:27:17,065] [main] INFO  com.google.gerrit.server.plugins.PluginLoader : Loaded plugin gitiles, version v3.0.1
[2019-09-11 13:27:17,094] [main] INFO  com.google.gerrit.server.plugins.PluginLoader : Loaded plugin hooks, version v3.0.1
[2019-09-11 13:27:17,118] [main] INFO  com.google.gerrit.server.plugins.PluginLoader : Loaded plugin plugin-manager, version v3.0.1
```
---

Docker basics
===

### Stop a container

```
$ docker stop 39a0263258f6
39a0263258f6
```

### Delete a container

```
$ docker rm 39a0263258f6
39a0263258f6
```

---

Docker basics
===

### Get container IP

```
$ docker inspect unruffled_goldstine |grep IP
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "100.64.0.2",
            "IPPrefixLen": 24,
            "IPv6Gateway": "",
                    "IPAMConfig": null,
                    "IPAddress": "100.64.0.2",
                    "IPPrefixLen": 24,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
```

---

Docker basics
===

### Execute another processus inside the container

```
$ docker exec -it unruffled_goldstine bash
root@cb651a07bbde:/#
```

---

Dockerfile files
===

Description of how the image should be built

```
FROM php:7.3-fpm-buster

RUN apt update && apt install -y --no-install-recommends wget curl git wget snmp unzip

COPY ./docker/base/fpm/resources/php.ini /usr/local/etc/php/php.ini

COPY ./docker/base/fpm/resources/entrypoint.sh /entrypoint

USER www-data

WORKDIR "/application"

ENTRYPOINT ["/entrypoint"]
```

---

Dockerfile builds
===

Description of how the image should be built

```
$ docker build -t my-image:v0.1 .
Digest: sha256:0edcfe1b610d878c8fbc036bdc68380e0ca102be6a250d139c5bd3669ba63c10
Sending build context to Docker daemon  56.14MB

Step 1/15 : FROM php:7.3-fpm-buster
7.3-fpm-buster: Pulling from library/php
Digest: sha256:23b1ecb3e4144c132f126d7dd4dab1e8215e7645c690edef0a40964749d4500b
Status: Image is up to date for php:7.3-fpm-buster
 ---> d2f084c97289
Step 2/15 : RUN apt update ...
 ---> Using cache
 ---> d131535f4e6d
Step 3/15 : COPY ./docker/base/fpm/resources/php.ini /usr/local/etc/php/php.ini
...
```
---

Docker images list
===

```
$ docker images
REPOSITORY                                                      TAG                                        IMAGE ID            CREATED             SIZE
my-image                                                        v0.1                                       ffa3e8f1253b        1 hour ago          12.7MB
nginx                                                           latest                                     ab56bba91343        4 days ago          126MB
php                                                             7.3-fpm-buster                             7d3076bd7d18        13 days ago         401MB
netboxcommunity/netbox                                          latest                                     4235b672902f        2 weeks ago         574MB
bitnami/redis                                                   5.0-debian-9                               4728a00b0b66        2 weeks ago         96.6MB
cleveritcz/oncall                                               latest                                     6c54dc35833b        3 weeks ago         784MB
redis                                                           4-alpine                                   442c73e7ad1d        3 weeks ago         20.4MB
nginx                                                           <none>                                     5a3221f0137b        4 weeks ago         126MB
debian                                                          stable                                     f5356914cf3c        4 weeks ago         114MB
debian                                                          buster                                     85c4fd36a543        4 weeks ago         114MB
netboxcommunity/netbox                                          v2.6.2-ldap                                dd8a992d667f        6 weeks ago         577MB
goalert/all-in-one                                              latest                                     c7bba1104fc0        7 weeks ago         149MB
alpine                                                          latest                                     b7b28af77ffe        2 months ago        5.58MB
gerritcodereview/gerrit                                         latest                                     514d2781f71d        2 months ago        564MB
nginx                                                           1.15-alpine                                dd025cdfe837        4 months ago        16.1MB
domistyle/idrac6                                                latest                                     21e598472b60        5 months ago        545MB
dictcp/oncall                                                   latest                                     1a46b171ebe1        12 months ago       715MB
postgres                                                        10.4-alpine                                962ed899c609        13 months ago       72.9MB
```

---

Publish image on registry
===

### Publish and push

```
$ docker tag my-image:v0.1 registry-host:5000/myteam/my-image

$ docker push registry-host:5000/myteam/my-image
```

### Pull from anywhere

```
$ docker pull registry-host:5000/myteam/my-image
```
