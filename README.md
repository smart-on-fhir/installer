## Get started with one line, using Vagrant
![SMART Logo](smart-logo.png)

The three prerequisites, which are available on Mac, Windows, and Linux
are (we have tested with the versions below, but other versions may be fine too):

1. [VirtualBox 5.0.20](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant 1.8.1](https://www.vagrantup.com/downloads.html)
3. [Ansible 2.1.0](http://docs.ansible.com/intro_installation.html)

*Note:* Ansible is not supported on Windows. If you want to build a SMART on FHIR VM on Windows,
please use the version of the installer which runs Ansible on the guest machine instead of using the one on the host OS. To enable this mode, please edit `Vagrantfile` by commenting out the "ansible" provisioner and enabling second "shell" provisioner before running `vagrant up`. An alternative options is to follow the
instructions in the "Building SMART-on-FHIR on fresh Ubuntu 16.04 machine (without
Vagrant)" section in this document.

*Note:* The default installation of GIT on Windows enables a LF to CRLF conversion
upon checkout which is going to mess up the install. You will need to make sure that this
conversion is disabled by running `git config --global core.autocrlf false`

*Note:* The Ansible requirement is a Python package that installs some console tools.
If you have the *pip* Python package manager installed, the easiest way to install the
correct version of Ansible is to run the following:

```
sudo pip install ansible==2.1.0
```

Once you have the prerequisites installed on your machine, you can:

```
vagrant plugin install vagrant-vbguest
git clone https://github.com/smart-on-fhir/installer
cd installer
```

Create a custom_settings.yml.  You can use the custom_settings_example.yml file as a starting point:

```
cp provisioning/custom_settings_example.yml provisioning/custom_settings.yml
vi provisioning/custom_settings.yml
```

Run the installer:

```
vagrant up
```

... wait ~20min while everything installs (depending on your Internet connection speed).

Now visit in a web browser on your local ("host") machine:

 * `http://localhost:9090/`  for the Sandbox Manager application
 * `http://localhost:9070/api/smartdstu2/data`  for a FHIR DSTU2 API server
 * `http://localhost:9070/api/smartdstu2/data/metadata`  for the FHIR DSTU2 API conformance
 * `http://localhost:9080/auth/`  for an OAuth2 authorization server
 * `http://localhost:9093`  for a SMART apps server

The authorization server uses the OpenLDAP server running on the virtual machine.
The two sample accounts are `demo/demo` and `admin/password` by default. You should change
these for production environments. You can connect to the LDAP server on `localhost:10389`.

You can poke around the virtual machine by doing:

```
vagrant ssh
```

And when you're done you can shut the virtual machine down with:

```
vagrant halt
```

*Note:* The SMART reference implementation stack is based on the [HSPC Reference Implementation stack](https://healthservices.atlassian.net/wiki/display/HSPC/HSPC+Reference+Implementation) which in turn is based upon [HAPI-FHIR](http://hapifhir.io). The authorization server is [MITREidConnect](http://mitreid-connect.github.io) and the underlying LDAP directory is [OpenLDAP](http://www.openldap.org). Please refer to these sites for details on administering and extending the stack components.

---

## Building SMART-on-FHIR on fresh Ubuntu 16.04 machine (without Vagrant)

In this example, we are going to skip the inventory and do a local install to the Ubuntu 16.04 machine directly.

From the Ubuntu 16.04 machine:
```
sudo apt-get update
sudo apt-get -y install curl git python-pycurl python-pip python-yaml python-paramiko python-jinja2
sudo pip install ansible==2.1.0
git clone https://github.com/smart-on-fhir/installer
cd installer/provisioning
```

Modify custom_settings.yml:
```
cp custom_settings_example.yml custom_settings.yml
vi custom_settings.yml
```
    * set "installer_user" to your ssh username
    * set "services_host" to a real-world route-able IP for your Ubuntu machine
    * setting passwords, ports, and other properties as desired

Note: it is not necessary to change the -i 'localhost, ' entry to be your hostname as this is referring to the Ansible inventory.

```
sudo ansible-playbook -c local -i 'localhost,' -vvvv site.yml
```

You may run a specific Ansible playbook such as:
```
sudo ansible-playbook -c local -i 'localhost,' -vvvv playbook-rebuild-databases.yml
```

You may run the Ansible playbook for specific tags using the --tags or --skip-tags flags such as:
```
sudo ansible-playbook -c local -i 'localhost,' -vvvv site.yml --tags "verify"
```

---

## Building SMART-on-FHIR on fresh Ubuntu 16.04 remote machine

In this example, we are going to use the inventory to install the platform on a remote Ubuntu 16.04 machine.

### Configure the remote machine
1. Install libraries
```
sudo apt-get update
sudo apt-get -y install curl git python-pycurl python-pip python-yaml python-paramiko python-jinja2
sudo pip install ansible==2.1.0
```
2. Set up SSH using certificates
Make sure that you have a user account on the remote machine that
has passwordless sudo privileges.  Enable SSH from your local machine to
the remote machine using certificates or password. If using an AWS EC2 Ubuntu
instance, your installer_user is "ubuntu" and your key is the .pem file established for access.

### Install remotely (from the local machine)
1. Install Libraries
```
sudo apt-get update
sudo apt-get install curl git python-pycurl python-pip python-yaml python-paramiko python-jinja2
sudo pip install ansible==2.1.0
```
2. Get the installer sourcecode
```
git clone https://github.com/smart-on-fhir/installer
cd installer/provisioning
```
3. Configure the inventory
```
vi inventory
```
    * set the REMOTEIP, REMOTEUSER, and KEYFILE as appropriate
4. Configure the custom_settings.yml using the custom_settings_example.yml as a reference.
```
cp custom_settings_example.yml custom_settings.yml
vi custom_settings.yml
```
    * set the REMOTEIP, REMOTEUSER, and KEYFILE as appropriate
    * set "installer_user" to your ssh username
    * set "services_host" to the IP of your remote machine
    * setting passwords, ports, and other properties as desired
5. Run the installer for remote installation
```
ansible-playbook -i 'inventory' site.yml
```

---

## Tips and Tricks

### AWS Test Configuration

Here is the exact configuration we use to test the installer using an AWS EC2 instance.  The ports must all be open for inbound connections in the security group.

| Item          | Value                   |
| ------------- | -----------------------:|
| Instance Type | t2.large                |
| AIM           | Ubuntu Server 16.04 LTS |
| SSH PORT      | 22                      |
| HTTP PORT     | 80                      |
| HTTPS PORT    | 443                     |
| LDAP PORT     | 10389                   |
| APPS PORTS    | 9070-9099               |

Here is the custom_settings.yml file:
```
installer_user: "ubuntu"
services_host: "x.x.x.x" (your IP address)
sample_patients_branch: "hapi-patients-testing"
app_server_host: "{{services_host}}"
api_dstu2_server_host: "{{services_host}}"
persona_api_dstu2_server_host: "{{services_host}}"
sandbox_manager_server_host: "{{services_host}}"
auth_server_host: "{{services_host}}"
persona_auth_server_host: "{{services_host}}"
messaging_server_host: "{{services_host}}"
```

Here are the commands we run:
```
sudo apt-get update
sudo apt-get -y install curl git python-pycurl python-pip python-yaml python-paramiko python-jinja2
sudo pip install ansible==2.1.0
git clone https://github.com/smart-on-fhir/installer
cd installer/provisioning
vi custom_settings.yml
... (see above)
sudo ansible-playbook -c local -i 'localhost,' -vvvv site.yml
...
(about 20 minutes later...)
PLAY RECAP *********************************************************************
localhost                  : ok=216  changed=167  unreachable=0    failed=0

ubuntu:~/installer/provisioning$
```

Then launch the Sandbox Manager app at:
```
http://(your IP address):9090/
```

### TLS

By default, the install process will not enable TLS. To enable TLS for specific services, you can set the following variable:

* `use_secure_http: true`

What certificates will be used? You have two options:

1. Set `use_custom_ssl_certificates: true` and `custom_ssl_certificate_path: /path/to/cert/dir`. For an example, see our [testing server settings](provisioning/ci-server.yml#L5). And for an example of what the directory layout should look like, [see here](provisioning/examples/certificates).

2. If you set `use_custom_ssl_certificates: false`, the installer will generate self-signed SSL certificates.
Please note that with self-signed certificates, you will get a number of trust warning in your
web browser that can be resolved by adding certificate exceptions in your browser, or updating your CA list on
a client by client basis. Before you even try the apps, you should probably load the
API server and add the self-signed certificate to your browser's security exceptions.

### Sample data
By default, the server will load data for only 20 sample patients. To automatically load the entire set of ~60 samples patients, you can update your `custom_settings` to increase this limit:

* `api_dstu2_sample_patients_limit: 100`

### Log Files
The installer creates servers that log to the journal.  You can view the journal logs using this command:

* sudo journalctl -u api-dstu2-server.service
* sudo journalctl -u auth-server.service

Use the -f option tail the logs. 

### Aliases
The installer creates several aliases that can be used to help you manage and navigate the sandbox system.

You can see the aliases by typing "alias" from the command prompt.  The aliases are defined in the ~/.bash_profile file.

```
ubuntu$ alias
```

These aliases are helpful to navigate the most important folders.
```
alias f='cd $FHIR_HOME'
alias i='cd $INSTALLER_HOME'
alias n='cd $NGINX_SITES'
alias p='cd $PROVISIONING_HOME'
alias s='cd $SERVICE_HOME'
```

These aliases are helpful for starting services.
```
alias startn='sudo service nginx start'
alias stopn='sudo service nginx stop'
```

These aliases are helpful for viewing (ex: v...) or tailing (ex: t...) different service logs.
```
alias tapi='sudo journalctl -f -u api-dstu2-server.service'
alias tapip='sudo journalctl -f -u persona-api-dstu2-server.service'
alias tauth='sudo journalctl -f -u auth-server.service'
alias tauthp='sudo journalctl -f -u persona-auth-server.service'
alias tldap='sudo journalctl -f -u apacheds-server.service'
alias tmsg='sudo journalctl -f -u messaging-server.service'
alias tpwm='sudo journalctl -f -u pwm-server.service'
alias tsand='sudo journalctl -f -u sandbox-manager-server.service'
alias v='sudo ansible-playbook  -c local -i localhost, -vvvv site.yml --tags "verify"'
alias vapi='sudo journalctl -u api-dstu2-server.service'
alias vapip='sudo journalctl -u persona-api-dstu2-server.service'
alias vauth='sudo journalctl -u auth-server.service'
alias vauthp='sudo journalctl -u persona-auth-server.service'
alias vldap='sudo journalctl -u apacheds-server.service'
alias vmsg='sudo journalctl -u messaging-server.service'
alias vpwm='sudo journalctl -u pwm-server.service'
alias vsand='sudo journalctl -u sandbox-manager-server.service'
```

