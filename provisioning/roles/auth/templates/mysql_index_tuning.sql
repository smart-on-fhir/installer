CREATE INDEX idx_authentication_holder_request_parameter_owner_id
ON authentication_holder_request_parameter(owner_id);

CREATE INDEX idx_authentication_holder_extension_owner_id
ON authentication_holder_extension(owner_id);

CREATE INDEX idx_authentication_holder_scope_owner_id
ON authentication_holder_scope(owner_id);

CREATE INDEX idx_authentication_holder_response_type_owner_id
ON authentication_holder_response_type(owner_id);

CREATE INDEX idx_saved_user_auth_authority_owner_id
ON saved_user_auth_authority(owner_id);

CREATE INDEX idx_launch_context_access_token_id
ON launch_context(access_token_id);

CREATE INDEX idx_authentication_holder_resource_id_owner_id
ON authentication_holder_resource_id(owner_id);

CREATE INDEX idx_authentication_holder_authority_owner_id
ON authentication_holder_authority(owner_id);

CREATE INDEX idx_token_scope_owner_id
ON token_scope(owner_id);

CREATE INDEX idx_approved_site_scope_owner_id
ON approved_site_scope(owner_id);

CREATE INDEX idx_client_scope_owner_id
ON client_scope(owner_id);


CREATE INDEX idx_client_response_type_owner_id
ON client_response_type(owner_id);

CREATE INDEX idx_client_resource_owner_id
ON client_resource(owner_id);

CREATE INDEX idx_client_post_logout_redirect_uri_owner_id
ON client_post_logout_redirect_uri(owner_id);

CREATE INDEX idx_client_redirect_uri_owner_id
ON client_redirect_uri(owner_id);

CREATE INDEX idx_client_request_uri_owner_id
ON client_request_uri(owner_id);

CREATE INDEX idx_client_grant_type_owner_id
ON client_grant_type(owner_id);

CREATE INDEX idx_client_default_acr_value_owner_id
ON client_default_acr_value(owner_id);

CREATE INDEX idx_client_claims_redirect_uri_owner_id
ON client_claims_redirect_uri(owner_id);

CREATE INDEX idx_client_contact_owner_id
ON client_contact(owner_id);

CREATE INDEX idx_client_authority_owner_id
ON client_authority(owner_id);

