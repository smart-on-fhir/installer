#!/bin/sh

cd ./installer/provisioning
ansible-playbook  -c local -i 'localhost,'  -t 'reset_db,load_patients' smart-on-fhir.yml 
