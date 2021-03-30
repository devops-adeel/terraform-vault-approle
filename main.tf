/**
 * Usage:
 *
 * ```hcl
 *
 * module "vault_approle" {
 *   source           = "git::https://github.com/devops-adeel/terraform-vault-approle.git?ref=v0.6.0"
 *   application_name = "tdp"
 *   env              = "dev"
 *   service          = "web"
 *   mount_accessor   = vault_auth_backend.default.accessor
 * }
 * ```
 */


locals {
  role_id        = format("%s-%s", var.application_name, var.service)
  group_id       = var.identity_group_id
  env            = var.env
  service        = var.service
  application    = var.application_name
  mount_accessor = var.mount_accessor
  backend_path   = "approle"
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
  metadata = {
    env         = local.env
    service     = local.service
    application = local.application
  }
}

resource "vault_identity_entity_alias" "default" {
  name           = local.role_id
  mount_accessor = local.mount_accessor
  canonical_id   = vault_identity_entity.default.id
}

resource "vault_identity_group_member_entity_ids" "default" {
  member_entity_ids = [vault_identity_entity.default.id]
  exclusive         = false
  group_id          = local.group_id
}
