resource "vault_auth_backend" "default" {
  type = "approle"
}

resource "vault_approle_auth_backend_role" "default" {
  backend   = vault_auth_backend.default.path
  role_name = var.application_name
}

#This is for outputs.tf
data "vault_approle_auth_backend_role_id" "default" {
  backend   = vault_auth_backend.default.path
  role_name = vault_approle_auth_backend_role.default.role_name
}

resource "vault_approle_auth_backend_role_secret_id" "default" {
  backend   = vault_auth_backend.default.path
  role_name = vault_approle_auth_backend_role.default.role_name
}

resource "vault_identity_entity" "default" {
  name = var.application_name
  metadata = {
    env     = var.env
    service = var.service
  }
}

resource "vault_identity_entity_alias" "default" {
  name           = var.application_name
  mount_accessor = vault_auth_backend.default.accessor
  canonical_id   = vault_identity_entity.default.id
}
