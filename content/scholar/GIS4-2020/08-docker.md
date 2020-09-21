---
linktitle: Docker reference
weight: 80
menu:
  main:
    parent:
      GIS4 - 2020
---

Docker
==

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

### List local images

```
$ docker image ls
REPOSITORY                 TAG                      IMAGE ID            CREATED             SIZE
bm-tftp                    0.1                      7ddc54652dcf        10 days ago         71.4MB
debian                     stable-slim              da838f7eb4f8        11 days ago         69.2MB
batman-dhcp                latest                   deb682e07fda        2 weeks ago         73.3MB
rabbitmq                   3-management             d55229deb03e        8 weeks ago         187MB
postgres                   11                       b7af9a7c9a68        3 months ago        282MB
alpine                     latest                   a24bb4013296        3 months ago        5.57MB
rabbitmq                   3.7-management           c497955c219a        4 months ago        180MB
redis                      alpine                   29c713657d31        4 months ago        31.6MB
golang                     1.13.11-buster           6a67120df3f4        4 months ago        803MB
nginx                      alpine                   89ec9da68213        5 months ago        19.9MB
djfarrelly/maildev         latest                   8c016b0ceb3c        14 months ago       79.8MB
mysql                      5.6.43                   bc788a6a2745        18 months ago       256MB
postgres                   10.2-alpine              400ef39e0dbf        2 years ago         39.5MB
```

### Delete local image

```
$ docker image rm 926fbd714c0e
Deleted: sha256:926fbd714c0e0ade9f56cfde5854b507e29dea584d747267a9d1fd92e4a21995
Deleted: sha256:c086d58b3b8a851bb63694c637725d89b4bec9bf42bc22afbcea80e04d6248f6
Deleted: sha256:de230fa08e61512837c758f79de4451b59aa7b35b059536ce8f092a798170341
Deleted: sha256:cce1de5fafa9b555b784b8aceb95f04a84bb24170aa59a017cfd0acd62248e64
Deleted: sha256:7bcfcbd4f645beaa4dc663a1c1d683e1eaf084c5a3a04ceeddd1ccd4a7ece044
Deleted: sha256:874b3e23fbaf3e9c3c08b0c8b3130633f9fc1b91bf49a41540f28cfed7d916a2
Deleted: sha256:4c07fcdde2c433bb04a6b989a78797648bf3603d4a1775c4719a6d18f08fbd27

```

### Start an image attached

```
$ docker run -it nginx:latest
# detach with ^C-P ^C-Q
```

### Start an image detached

```
$ docker run -d nginx:latest
39a0263258f66217fc751aeb799b586d9d14b709f6d2a5dbd502afaa7e89b636
```

### List containers

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
b9568988ad7a        nginx:latest        "nginx -g 'daemon of…"   3 minutes ago       Up 3 minutes        80/tcp              agitated_feynman
39a0263258f6        nginx:latest        "nginx -g 'daemon of…"   4 minutes ago       Up 4 minutes        80/tcp              suspicious_bardeen
```
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

### Execute another processus inside the container

```
$ docker exec -it unruffled_goldstine bash
root@cb651a07bbde:/#
```

Dockerfile
==

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
==

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
