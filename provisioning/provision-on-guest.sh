#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# fetch aptitude updates
sudo apt-get update

# install prerequisite packages
sudo apt-get -y install curl \
                        git \
                        python-pycurl \
                        python-pip \
                        python-yaml \
                        python-paramiko \
                        python-jinja2 \
                        ssl-cert

# install Ansible
sudo pip install ansible==2.1.0

# Run Ansible Playbook
cd /vagrant/provisioning
ansible-playbook -c local -i 'localhost,' site.yml
