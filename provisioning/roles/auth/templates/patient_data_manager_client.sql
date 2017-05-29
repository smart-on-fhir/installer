SET AUTOCOMMIT = 0;

START TRANSACTION;

-- Patient Data Manager App
INSERT INTO client_details (client_id, client_name, logo_uri, access_token_validity_seconds, token_endpoint_auth_method) VALUES
  ('patient_data_manager', 'Patient Data Manager App', 'https://apps.hspconsortium.org/hspc-patient-data-manager/static/patient-data-manager/images/pdm.png', 86400, 'NONE');

INSERT INTO client_scope (owner_id, scope) VALUES
  ((SELECT id from client_details where client_id = 'patient_data_manager'), 'launch'),
  ((SELECT id from client_details where client_id = 'patient_data_manager'), 'patient/*.*');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
  ((SELECT id from client_details where client_id = 'patient_data_manager'), 'authorization_code');

COMMIT;

SET AUTOCOMMIT = 1;
