locals {
  role_id      = format("%s-%s", var.application_name, var.service)
  backend_path = "approle"
}

resource "vault_approle_auth_backend_role" "default" {
  backend   = local.backend_path
  role_name = local.role_id
  role_id   = local.role_id
  depends_on = [
    vault_identity_entity_alias.default,
  ]
}

resource "vault_approle_auth_backend_role_secret_id" "default" {
  backend   = local.backend_path
  role_name = vault_approle_auth_backend_role.default.role_name
}

resource "vault_identity_entity" "default" {
  name = local.role_id
}

resource "vault_identity_entity_alias" "default" {
  name           = local.role_id
  mount_accessor = var.mount_accessor
  canonical_id   = vault_identity_entity.default.id
}

resource "vault_identity_group" "default" {
  name              = local.role_id
  type              = "internal"
  member_entity_ids = [vault_identity_entity.default.id]
  metadata = {
    env          = var.env
    service_name = var.service
    application  = var.application_name
  }
}
