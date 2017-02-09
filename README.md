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
vagrant up
```

... wait ~20min while everything installs (depending on your Internet connection speed).

Now visit in a web browser on your local ("host") machine:

 * `http://localhost:9090/`  for the Sandbox Manager application
 * `http://localhost:9070/api/data`  for a FHIR DSTU2 API server
 * `http://localhost:9080/auth/`  for an OAuth2 authorization server
 * `http://localhost:9093`  for a SMART apps server

The authorization server uses the OpenLDAP server running on the virtual machine.
The two sample accounts are `demo/demo` and `admin/password` by default. You should change
these for production environments. You can connect to the LDAP server on `localhost:1389`.

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

```
sudo apt-get update
sudo apt-get install curl git python-pycurl python-pip python-yaml python-paramiko python-jinja2
sudo pip install ansible==2.1.0
git clone https://github.com/smart-on-fhir/installer
cd installer/provisioning
```

At this point, you probably want to edit `custom_settings.yml` or pass a
vars file with settings that suit your needs.  For example, change `localhost`
to some world-routable hostname if that's what you need -- and set the
app_server public port to 80.
Note: it is not necessary to change the -i 'localhost, ' entry to be your hostname as this is referring to the Ansible inventory.

```
sudo ansible-playbook  -c local -i 'localhost,' -vvvv site.yml
```

You may run a specific Ansible playbook such as:
```
sudo ansible-playbook  -c local -i 'localhost,' -vvvv playbook-rebuild-databases.yml
```

You may run the Ansible playbook for specific tags using the --tags or --skip-tags flags such as:
```
sudo ansible-playbook  -c local -i 'localhost,' -vvvv site.yml --tags "verify"
```

---

## Building SMART-on-FHIR on fresh Ubuntu 16.04 remote machine

You can build a remote machine using your local Ansible. 

### Configure the Remote Machine
1. Install Libraries
```
sudo apt-get update
sudo apt-get install curl git python-pycurl python-pip python-yaml python-paramiko python-jinja2
sudo pip install ansible==2.1.0
```
2. Set up SSH using Certificates
Make sure that you have a user account on the remote machine that
has passwordless sudo privileges.  Enable SSH from your local machine to
 the remote machine using certificates or password.
3. Configure the installer
Edit `site.yml` locally replacing `REMOTEHOST` and `REMOTEUSER` 
with the hostname or IP of your remote host and the user account with the 
sudo privileges. Also, don't forget to update the `custom_settings.yml` 
file to suit your needs. 

### Install Remotely
The steps (on the local machine, replacing REMOTEHOST):
```
sudo apt-get update
sudo apt-get install curl git python-pycurl python-pip python-yaml python-paramiko python-jinja2
sudo pip install ansible==2.1.0
git clone https://github.com/smart-on-fhir/installer
cd installer/provisioning
vi site.yml
vi custom_settings.yml
ansible-playbook -i "REMOTEHOST," site.yml
```
*Note:*  If your install returns an error "ESTABLISH SSH CONNECTION FOR USER: None", 
explicitly pass the user (replacing {user} with your username):
```
ansible-playbook -i "REMOTEHOST," -e "ansible_user={user}" site.yml
```

---

## Notes

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

### SMART on FHIR Versions

#### SMART on FHIR 0.2.0 / FHIR 1.0.1 (DSTU2)

* Sample Patients: v0.1.0
* FHIR Starter: v0.1.0
* Cardiac Risk App: v0.1.0
* BP Centiles App: v0.1.0
* Growth Chart App: v0.1.0
* FHIR Demo App: v0.1.0

#### SMART on FHIR 0.1.0 / FHIR 1.0.1 (DSTU2)

* API Server: v0.1.0
* Auth Server: f0.1.0
* Auth LDAP Overlay: f0.1.0
* Sample Patients: v0.1.0
* FHIR Starter: v0.1.0
* Cardiac Risk App: v0.1.0
* BP Centiles App: v0.1.0
* Growth Chart App: v0.1.0
* FHIR Demo App: v0.1.0

#### SMART on FHIR 0.0.5 / FHIR 0.0.82 (DSTU1)

* API Server: v0.0.5
* Auth Server: f0.0.5
* Auth LDAP Overlay: f0.0.4
* Sample Patients: v0.0.5
* FHIR Starter: v0.0.5
* Cardiac Risk App: v0.0.5
* BP Centiles App: v0.0.5
* Growth Chart App: v0.0.5
* FHIR Demo App: v0.0.5
