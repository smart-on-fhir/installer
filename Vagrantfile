# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.hostname = "smart-on-fhir"
    config.vm.box = "bento/ubuntu-16.04"

    # MYSQL Database
    config.vm.network :forwarded_port, guest: 3306, host: 3307

    # Auth Server
    config.vm.network :forwarded_port, guest: 9060, host: 9060

    # API_DSTU2 Server
    config.vm.network :forwarded_port, guest: 9075, host: 9075
    # Mock-API_DSTU2 Server
    config.vm.network :forwarded_port, guest: 9275, host: 9275
    # API_STU3 Server
    config.vm.network :forwarded_port, guest: 9076, host: 9076
    # Mock-API_STU3 Server
    config.vm.network :forwarded_port, guest: 9276, host: 9276

    # Sandbox Manager
    config.vm.network :forwarded_port, guest: 9080, host: 9080
    # Sandbox Manager API
    config.vm.network :forwarded_port, guest: 13000, host: 13000

    # Messaging Server
    config.vm.network :forwarded_port, guest: 9091, host: 9091
    # PWM Server
    config.vm.network :forwarded_port, guest: 9092, host: 9092
    # Apps Server
    config.vm.network :forwarded_port, guest: 9093, host: 9093

    # Patient Picker Server
    # Currently hosted inside the apps system
    #  config.vm.network :forwarded_port, guest: 9094, host: 9094

    # Appointments
    config.vm.network :forwarded_port, guest: 9095, host: 9095
    # Patient Data Manager
    config.vm.network :forwarded_port, guest: 9096, host: 9096

    # ApacheDS
    config.vm.network :forwarded_port, guest: 10389, host: 10389

    config.vm.provider "virtualbox" do |vb|
        vb.name = "SMART on FHIR Platform"
        vb.memory = "6144"
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
        #    ansible.tags=["smart-platform"]
        #    ansible.playbook = "playbook_patient_picker.yml"
        ansible.compatibility_mode="2.0"
        ansible.playbook = "site.yml"
        # append to the auto-generated inventory file
        ansible.extra_vars = {
            env: "local"
        }
    end

    # If you are running the build on a Windows host, please comment out the
    # "ansible" provisioner above and use this "shell" provisioner:
    #
    # config.vm.provision "shell", path: "provision-on-guest.sh"

end
