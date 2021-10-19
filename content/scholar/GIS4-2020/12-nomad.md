---
linktitle: Nomad reference
weight: 120
menu:
  main:
    parent:
      GIS4 - 2020
---

Nomad
=

What is Nomad?
==

* Lightweight orchestrator written in Go by HashiCorp
* Available on most Unix distributions
* Allow to deploy containers accross multiple hosts

Nomad architecture
==

* Nomad is separated in two roles: master and client
* Masters receive order and transmit them to the clients
* Masters ensure the order is respected as much as possible
* In our scenario: the master is the client too

Nomad configuration files
==

Separated according to their usage:

* `/etc/nomad.d/base.hcl`
* `/etc/nomad.d/client.hcl`
* `/etc/nomad.d/server.hcl`

Nomad job definition
==

```
job "my-website" {
  datacenters = ["dc1"]
  type = "service"

  update {
    max_parallel = 1
    min_healthy_time = "10s"
    healthy_deadline = "3m"
  }

  migrate {
    max_parallel = 1
    health_check = "checks"
    min_healthy_time = "10s"
    healthy_deadline = "5m"
  }

  group "web-app" {
    count = 4

    restart {
      attempts = 2
      interval = "30m"
      delay = "30s"
      mode = "fail"
    }
    
    network {
      port "web" {
        to = 8080
      }
    }

    task "nginx" {
      driver = "docker"

      config {
        image = "registry-host:5000/myteam/my-image"
        ports = ["web"]
      }

      resources {
        cpu    = 500
        memory = 1024
      }

      service {
        name = "my-webapp"
        tags = ["web"]
        port = "web"
        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
```
