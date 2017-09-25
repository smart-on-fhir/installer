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
    config.vm.network :forwarded_port, guest: 9071, host: 9071
    # Mock-API_DSTU2 Server
    config.vm.network :forwarded_port, guest: 9271, host: 9271
    # API_STU3 Server
    config.vm.network :forwarded_port, guest: 9074, host: 9074
    # Mock-API_STU3 Server
    config.vm.network :forwarded_port, guest: 9274, host: 9274

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
            env: "local",
            installer_user: "vagrant",
            hosting_userpass: "",
            keystore_password: "changeme",
            hspc_platform_jwt_key: "changeme",
            aws_access_key_id: "changeme",
            aws_secret_access_key: "changeme",
            aws_ec2_volume_id: "changeme",
            aws_region: "changeme",
            enable_backup_restore_jobs: true,
            enable_aws_snapshot: false,
            enable_pwm: false,
            mysql_root_pass: "password",
            mysql_password: "password",
            auth_server_admin_password: "password",
            sandbox_server_admin_access_client_secret: "changeme",
            certificate_crt_filename: "self-signed-certificate.crt",
            certificate_key_filename: "self-signed-certificate.key",
            email_smtp_address: "changeme",
            email_smtp_username: "changeme",
            email_smtp_password_encrypted: "changeme",
            apacheds_server_system_admin_password: "secret",
            apacheds_server_sandbox_admin_password: "password",
            pwm_configpasswordhash: "changeme",
            pwm_securitykey_encrypted: "changeme",
            pwm_db_password_encrypted: "changeme",
            pwm_ldap_proxy_password_encrypted: "changeme",
            api_server_oauth2_clientSecret: "secret",
            sandman_server_artifact_version: "2.0.0",
            sandman_api_server_artifact_version: "0.2.2",
            messaging_mail_server_username: "changeme",
            messaging_mail_server_password: "changeme",
            patient_data_manager_project_version: "1.0.2",
            bilirubin_risk_chart_project_version: "master"
        }
    end

    # If you are running the build on a Windows host, please comment out the
    # "ansible" provisioner above and use this "shell" provisioner:
    #
    # config.vm.provision "shell", path: "provision-on-guest.sh"

end
