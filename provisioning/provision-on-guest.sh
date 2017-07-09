#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# prepare the host machine
sudo apt-get update

sudo apt-get -y install curl git python-pycurl python-pip python-yaml python-paramiko python-jinja2

sudo pip install ansible==2.1.0

git clone https://github.com/smart-on-fhir/installer

cd installer/provisioning

# modify the group_vars for your environment
#vi inventory/group_vars/all.yml

sudo ansible-playbook -i inventory/hosts site.yml
