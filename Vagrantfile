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
# Persona-Auth Server
  config.vm.network :forwarded_port, guest: 9160, host: 9160

# API_DSTU2 Server
  config.vm.network :forwarded_port, guest: 9071, host: 9071
# Persona-API_DSTU2 Server
  config.vm.network :forwarded_port, guest: 9171, host: 9171
# Mock-API_DSTU2 Server
  config.vm.network :forwarded_port, guest: 9271, host: 9271
# API_STU3 Server
  config.vm.network :forwarded_port, guest: 9074, host: 9074
# Mock-API_STU3 Server
  config.vm.network :forwarded_port, guest: 9274, host: 9274

# Sandbox Manager
  config.vm.network :forwarded_port, guest: 9080, host: 9080

# Messaging Server
  config.vm.network :forwarded_port, guest: 9091, host: 9091
# PWM Server
  config.vm.network :forwarded_port, guest: 9092, host: 9092
# Apps Server
  config.vm.network :forwarded_port, guest: 9093, host: 9093
# Patient Picker Server
  config.vm.network :forwarded_port, guest: 9094, host: 9094
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
#    ansible.playbook = "provisioning/playbook_api_stu3.yml"
    ansible.playbook = "provisioning/site.yml"
    # append to the auto-generated inventory file
    ansible.extra_vars = {
      installer_user: "vagrant",
      services_host: "localhost",
      use_secure_http: true,
      use_custom_ssl_certificates: false,
      certificate_crt_filename: "self-signed-certificate.crt",
      certificate_key_filename: "self-signed-certificate.key",
      keystore_password: "changeme",
      hspc_platform_jwt_key: "changeme",
      aws_output_format: "json",
      aws_region: "changeme",
      aws_access_key_id: "changeme",
      aws_secret_access_key: "changeme",
      aws_ec2_volume_id: "changeme",
      mysql_password: "password",
      enable_pwm: false,
      pwm_server_external_host: "{{services_host}}",
      pwm_server_external_port: "9092",
      apacheds_server_external_host: "{{services_host}}",
      apacheds_server_system_admin_password: "changeme",
      apacheds_server_sandbox_admin_password: "changeme",
      auth_server_external_host: "{{services_host}}",
      auth_server_external_port: "9060",
      auth_server_initial_memory: "128M",
      auth_server_max_memory: "256M",
      auth_server_newUserUrl: "",
      auth_server_forgotPasswordUrl: "",
      auth_server_admin_password: "changeme",
      auth_mysql_reset_database: true,
      api_server_oauth2_clientId: "hspc_resource_server",
      api_server_oauth2_clientSecret: "secret",
      api_dstu2_server_external_host: "{{services_host}}",
      api_dstu2_server_external_port: "9071",
      api_dstu2_server_initial_memory: "128M",
      api_dstu2_server_max_memory: "256M",
      api_dstu2_mysql_reset_database: true,
      api_dstu2_sample_patients_limit: "20",
      mock_api_dstu2_server_external_host: "{{services_host}}",
      mock_api_dstu2_server_external_port: "9271",
      mock_api_dstu2_server_initial_memory: "128M",
      mock_api_dstu2_server_max_memory: "256M",
      api_stu3_server_external_host: "{{services_host}}",
      api_stu3_server_external_port: "9074",
      api_stu3_server_initial_memory: "128M",
      api_stu3_server_max_memory: "256M",
      api_stu3_mysql_reset_database: true,
      mock_api_stu3_server_external_host: "{{services_host}}",
      mock_api_stu3_server_external_port: "9274",
      mock_api_stu3_server_initial_memory: "128M",
      mock_api_stu3_server_max_memory: "256M",
      messaging_server_external_host: "{{services_host}}",
      messaging_server_external_port: "9091",
      sandman_mysql_reset_database: true,
      enable_backup_restore_jobs: false,
      enable_aws_snapshot: false,
      enable_api_sample_data: true,
      enable_mock_endpoints: false,
      messaging_server_initial_memory: "64M",
      messaging_server_max_memory: "128M",
      messaging_profiles: "test",
      sandman_server_external_host: "{{services_host}}",
      sandman_server_external_port: "9080",
      sandman_server_initial_memory: "128M",
      sandman_server_max_memory: "256M",
      sandman_server_send_email: false,
      sandbox_server_admin_access_client_secret: "changeme",
      apps_server_external_host: "{{services_host}}",
      apps_server_external_port: "9093"
    }
  end

  # If you are running the build on a Windows host, please comment out the
  # "ansible" provisioner above and use this "shell" provisioner:
  #
  # config.vm.provision "shell", path: "provisioning/provision-on-guest.sh"

end
