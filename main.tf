locals {
  vault_auth_backend          = data.vault_auth_backend.default.accessor ? data.vault_auth_backend.default.path : vault_auth_backend.default.path
  vault_auth_backend_accessor = data.vault_auth_backend.default.accessor ? data.vault_auth_backend.default.accessor : vault_auth_backend.default.accessor
}

data "vault_auth_backend" "default" {
  path = "approle"
}

resource "vault_auth_backend" "default" {
  count = data.vault_auth_backend.default.accessor ? 0 : 1
  type  = "approle"
}

resource "vault_approle_auth_backend_role" "default" {
  backend   = local.vault_auth_backend
  role_name = format("%s-%s", var.application_name, var.service)
}

#This is for outputs.tf
data "vault_approle_auth_backend_role_id" "default" {
  backend   = local.vault_auth_backend
  role_name = vault_approle_auth_backend_role.default.role_name
}

resource "vault_approle_auth_backend_role_secret_id" "default" {
  backend   = local.vault_auth_backend
  role_name = vault_approle_auth_backend_role.default.role_name
}

resource "vault_identity_entity" "default" {
  name = format("%s-%s", var.application_name, var.service)
  metadata = {
    env     = var.env
    service = var.service
  }
}

resource "vault_identity_entity_alias" "default" {
  name           = format("%s-%s", var.application_name, var.service)
  mount_accessor = local.vault_auth_backend_accessor
  canonical_id   = vault_identity_entity.default.id
}
