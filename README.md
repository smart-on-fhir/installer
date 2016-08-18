## Get started with one line, using Vagrant
![SMART Logo](smart-logo.png)

The three prerequisites, which are available on Mac, Windows, and Linux
are (we have tested with the versions below, but other versions may be fine too):

1. [VirtualBox 5.0.20](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant 1.8.1](http://www.vagrantup.com/downloads)
3. [Ansible 2.1.0](http://docs.ansible.com/intro_installation.html)

*Note:* Ansible is not supported on Windows. If you want to build a SMART on FHIR VM on Windows,
please use the version of the installer in the "ansible-guest" branch which runs Ansible on the
guest machine instead of using the one on the host OS. To switch the branch, execute
`git checkout ansible-guest` before running `vagrant up`. Another options is to follow the
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

 * `http://localhost:9080`  for a FHIR API server
 * `http://localhost:9085`  for an OAuth2 authorization server
 * `http://localhost:9090`  for a SMART apps server

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

```
sudo ansible-playbook  -c local -i 'localhost,' -vvvv smart-on-fhir.yml
```

---

## Notes

### SSL
By default, the install process will not enable SSL. To enable SSL for specific services, you can set the following variables to `true`:

* `auth_server_secure_http`: Authorization server
* `fhir_server_secure_http`: API server
* `app_server_secure_http`: App server

What certificates will be used? You have two options:

1. Set `use_custom_ssl_certificates: true` and `custom_ssl_certificate_path: /path/to/cert/dir`. For an example, see our [testing server settings](provisioning/ci-server.yml#L5). And for an example of what the directory layout should look like, [see here](provisioning/examples/certificates).

2. If you set `use_custom_ssl_certificates: false`, the installer will generate self-signed SSL certificates.
Please note that with self-signed certificates, you will get a number of trust warning in your
web browser that can be resolved by adding certificate exceptions in your browser, or updating your CA list on
a client by client basis. Before you even try the apps, you should probably load the
API server and add the self-signed certificate to your browser's security exceptions.

### Sample data
By default, the server will load data for only 10 sample patients. To automatically load the entire set of ~60 samples patients, you can update your `custom_settings` to increase this limit:

* `sample_patients_limit: 100`

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
