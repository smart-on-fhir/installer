# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.hostname = "smart-on-fhir"
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.network :forwarded_port, guest: 9080, host: 9080
  config.vm.network :forwarded_port, guest: 9085, host: 9085
  config.vm.network :forwarded_port, guest: 9090, host: 9090
  config.vm.network :forwarded_port, guest: 389, host: 1389
    config.vm.network :forwarded_port, guest: 9095, host: 9095

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end

  config.vm.provision "shell", path: "provisioning/fetch-templates.sh", args: ["/vagrant/provisioning/roles/common/templates/config","v0.1.2"]

  config.vm.provision "ansible" do |ansible|
#    ansible.verbose="vvvv"
#    ansible.tags=["load_patients"]
    ansible.playbook = "provisioning/smart-on-fhir.yml"
  end

  # If you are running the build on a Windows host, please comment out the
  # "ansible" provisioner above and use this "shell" provisioner:
  #
  # config.vm.provision "shell", path: "provisioning/provision-on-guest.sh"

end
