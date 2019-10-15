---
title: Ansible
weight: 120
menu:
  main:
    parent:
      GIS4 - 2019
---

Ansible
---

### What is Ansible?

* Automation tool
* Used mostly remotely to deploy and manage
* Used to describe final configuration
* Just YAML files


---

### How to use Ansible

* Ruled by playbooks

```
$ cat certificate.yml
- name: deploy certificates
  hosts:
    - loadbalancers
  roles:
    - certificates
    - loadbalancing
```

---

### How to use Ansible

* Run it

```
$ ansible-playbook -i inventory certificate.yml --diff --check
...
TASK [arillso.logrotate : install logrotate packages] *************************
ok: [haproxy-01]
ok: [haproxy-02]

TASK [arillso.logrotate : create logrotate configuration file] ****************
ok: [haproxy-01]
ok: [haproxy-02]

PLAY RECAP ********************************************************************
haproxy-01 : ok=16   changed=0    unreachable=0    failed=0
haproxy-02 : ok=17   changed=2    unreachable=0    failed=0
```

---

### How to use Ansible

```
$ cat deploy-server.yml
- name: deploy virtual machines
  hosts: localhost
  gather_facts: false
  tasks:
    - name: create vms
      proxmox_kvm:
        api_host: "{{ proxmox_api_host }}"
        api_user: "{{ proxmox_api_user }}"
        api_password: "{{ proxmox_api_password }}"
        node: "{{ target_server }}"
        target: "{{ item.value.node }}"
        vmid: "{{ item.value.template }}"
        newid: "{{ item.value.id }}"
        name: "{{ item.key.split('.')[0] }}"
        state: present
        clone: "{{ item.value.template }}"
        full: true
        timeout: 300
      with_dict: "{{ hostvars }}"
      when: "item.value.template is defined"
```

---

### How to use Ansible

```
cat inventory
all:
  children:
    loadbalancer:
      hosts:
        haproxy01:
          ansible_host: 10.1.1.2
          id: 101
          template: 100
    nomad-servers:
      vars:
        consul_node_role: client
        nomad_node_role: server
      hosts:
        nomad-server01:
          ansible_host: 10.2.1.1
          id: 102
          template: 100
        nomad-server02:
          ansible_host: 10.2.1.2
          id: 103
          template: 100
```

---

### How to use Ansible

```
> cat roles/loadbalancing/tasks/main.yml
---

- name: install haproxy
  tags: loadbalancing
  apt:
    name: haproxy

- name: configure haproxy
  tags: loadbalancing
  template:
    src: "haproxy-{{env}}.cfg.j2"
    dest: "/etc/haproxy/haproxy.cfg"
    validate: "/usr/sbin/haproxy -c -f %s"
  notify: restart haproxy

- name: start haproxy
  tags: loadbalancing
  service:
    name: haproxy
    state: started
```

---

### How to use Ansible

```
deploy-files.yml         # playbook
group_vars/
    all.yml              # variables for all hosts
    nomad-servers.yml    # variables for group nomad-servers
roles/
    common/
        tasks/
            main.yml     # where actions are defined
        handlers/
            main.yml     # where actions are triggered
        templates/
            ntp.conf.j2  # templates file
        files/
            bar.txt      # static file
        vars/
            main.yml     # variables file
        defaults/
            main.yml     # default variables
```

---

### Ansible by example

Copy a static file

```
- name: deploy files
  hosts: my-server
  tasks:
    - name: deploy this file
      file:
        src: motd
        dest: /etc/motd
        mode: 0644
        owner: root
        group: root
```

---

### Ansible by example

Copy a template

```
cat roles/loadbalancing/tasks/main.yml
- name: configure haproxy
  template:
    src: "haproxy-{{env}}.cfg.j2"
    dest: "/etc/haproxy/haproxy.cfg"
    validate: "/usr/sbin/haproxy -c -f %s"
  notify: restart haproxy
```

Handle signals

```
- name: restart haproxy
  service:
    name: haproxy
    state: restarted
```

---

### Roles are here to help

Community role example

```
- name: install docker
  hosts:
    - nomad-nodes
  roles:
    - geerlingguy.docker
```

How to install it

```
ansible-galaxy install geerlingguy.docker
```
