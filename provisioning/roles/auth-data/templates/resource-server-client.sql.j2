SET AUTOCOMMIT = 0;

START TRANSACTION;

-- HSPC Resource Server
INSERT INTO client_details (client_id, client_secret, client_name, dynamically_registered, refresh_token_validity_seconds, access_token_validity_seconds, id_token_validity_seconds, allow_introspection) VALUES
	('hspc_resource_server', 'secret', 'HSPC Resource Server', false, null, 3600, 600, true);

INSERT INTO client_scope (owner_id, scope) VALUES
	((SELECT id from client_details where client_id = 'hspc_resource_server'), 'openid'),
	((SELECT id from client_details where client_id = 'hspc_resource_server'), 'launch'),
	((SELECT id from client_details where client_id = 'hspc_resource_server'), 'patient/*.read'),
	((SELECT id from client_details where client_id = 'hspc_resource_server'), 'patient/*.*'),
	((SELECT id from client_details where client_id = 'hspc_resource_server'), 'user/*.*'),
	((SELECT id from client_details where client_id = 'hspc_resource_server'), 'smart/orchestrate_launch');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	((SELECT id from client_details where client_id = 'hspc_resource_server'), 'authorization_code');

COMMIT;

SET AUTOCOMMIT = 1;
