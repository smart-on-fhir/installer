#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# prepare the host machine
sudo apt-get update

sudo apt-get -y install curl git python-pycurl python-pip python-yaml python-paramiko python-jinja2

sudo pip install ansible==2.1.0

git clone https://github.com/smart-on-fhir/installer

cd installer/provisioning

cp inventory_example.yml inventory

sudo ansible-playbook -c local -i 'localhost,' -vvvv site.yml
