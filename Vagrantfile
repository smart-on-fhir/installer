# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.hostname = "smart-on-fhir"
  config.vm.box = "bento/ubuntu-16.04"

# MYSQL Database
  config.vm.network :forwarded_port, guest: 3306, host: 3307

# API_DSTU2 Server
  config.vm.network :forwarded_port, guest: 9070, host: 9070
# Persona-API_DSTU2 Server
  config.vm.network :forwarded_port, guest: 9071, host: 9071
# Mock-API_DSTU2 Server
  config.vm.network :forwarded_port, guest: 9074, host: 9074
# API_STU3 Server
  config.vm.network :forwarded_port, guest: 9072, host: 9072
# Persona-API_STU3 Server
  config.vm.network :forwarded_port, guest: 9073, host: 9073

# Auth Server
  config.vm.network :forwarded_port, guest: 9080, host: 9080
# Persona-Auth Server
  config.vm.network :forwarded_port, guest: 9081, host: 9081

# Sandbox Manager
  config.vm.network :forwarded_port, guest: 9090, host: 9090
# Messaging Server
  config.vm.network :forwarded_port, guest: 9091, host: 9091
# PWM Server
  config.vm.network :forwarded_port, guest: 9092, host: 9092
# Apps Server
  config.vm.network :forwarded_port, guest: 9093, host: 9093
# ApacheDS
  config.vm.network :forwarded_port, guest: 10389, host: 10389

  config.vm.provider "virtualbox" do |vb|
    vb.name = "SMART on FHIR Platform"
    vb.memory = "5120"
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
  end

  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end

  config.vm.provision "ansible" do |ansible|
#    ansible.verbose="vvvv"
    ansible.tags=["smart-platform"]
    ansible.playbook = "provisioning/site.yml"
  end

  # If you are running the build on a Windows host, please comment out the
  # "ansible" provisioner above and use this "shell" provisioner:
  #
  # config.vm.provision "shell", path: "provisioning/provision-on-guest.sh"

end
