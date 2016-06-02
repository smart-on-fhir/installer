## Get started with one line, using Vagrant
![SMART Logo](smart-logo.png)


The three prerequisites, which are available on Mac, Windows, and Linux
are (we have tested with the versions below, but other versions may be fine too):

1. [VirtualBox 5.0.20](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant 1.8.1](http://www.vagrantup.com/downloads)
3. [Ansible 2.1.0](http://docs.ansible.com/intro_installation.html)

Once you have the prerequisites installed on your machine, you can:

```
sudo ansible-galaxy install franklinkim.docker
sudo ansible-galaxy install franklinkim.docker-compose
git clone https://github.com/nschwertner/installer-hspc
cd installer-hspc
vagrant up
```

... wait ~20min while everything installs (depending on your Internet connection speed).
