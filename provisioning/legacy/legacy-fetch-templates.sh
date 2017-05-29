#!/bin/bash

dir=${1-roles/apps/templates/config}
branch=${2-master}

# Download configuration templates for SMART Apps
#mkdir -p $dir
#wget -q https://raw.githubusercontent.com/smart-on-fhir/fhir-starter/$branch/fhirStarter/apps.json.default -O $dir/apps.json.j2
#wget -q https://raw.githubusercontent.com/smart-on-fhir/fhir-starter/$branch/fhirStarter/services.js.default -O $dir/services.js.j2
#echo Downloaded Configuration Templates
