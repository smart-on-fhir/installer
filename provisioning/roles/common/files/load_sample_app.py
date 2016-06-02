#!/usr/bin/python

"""
Idempotently load a single app into the MITREid Connect server
using PUT if it exists already, and POST if it doesn't.

Test via:
load_sample_apps.py "$(cat testapp.json)" http://localhost:9085 client secret
"""

import sys
import requests
import json

app_to_load = json.loads(sys.argv[1])
server = sys.argv[2]
auth = (sys.argv[3], sys.argv[4])

loaded_req = requests.request('GET', server+'/api/clients', auth=auth, verify=False)
assert (loaded_req.status_code == 200)
apps_loaded = { r['clientId'] : r for r in loaded_req.json() }

client_id = app_to_load['clientId']

if client_id in apps_loaded:
    app_id = str(apps_loaded[client_id]['id'])
    put_req = requests.request('PUT',
            server+'/api/clients/'+app_id,
            data=json.dumps(app_to_load),
            auth=auth,
            headers={'Content-type': 'application/json'},
            verify=False)
    assert (put_req.status_code in (200, 201))
else:
    post_req = requests.request('POST',
            server+'/api/clients',
            data=json.dumps(app_to_load),
            auth=auth,
            headers={'Content-type': 'application/json'},
            verify=False)
    assert (post_req.status_code in (200, 201))
