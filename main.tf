resource "vault_auth_backend" "default" {
  type     = "approle"
}

resource "vault_approle_auth_backend_role" "default" {
  backend   = vault_auth_backend.default.path
  role_name = var.application_name
}

#This is for outputs.tf
data "vault_approle_auth_backend_role_id" "default" {
  backend   = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.default.role_name
}

resource "vault_approle_auth_backend_role_secret_id" "default" {
  backend   = vault_auth_backend.default.path
  role_name = vault_approle_auth_backend_role.default.role_name
}

data "vault_policy_document" "default" {
  rule {
    path         = "sys/policies/acl/*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    description  = "Create and manage ACL policies"
  }
  rule {
    path         = "auth/*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    description  = "Manage auth methods broadly across Vault Namespace"
  }
  rule {
    path         = "sys/auth/*"
    capabilities = ["read"]
    description  = "List auth methods"
  }
  rule {
    path         = "auth/token/create"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "create child tokens"
  }
  rule {
    path         = "secret/*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    description  = "List, create, update, and delete key/value secrets"
  }
  rule {
    path         = "sys/mounts"
    capabilities = ["read"]
    description  = "List existing secrets engines."
  }
}

resource "vault_policy" "default" {
  name     = "namespace-admin"
  policy   = data.vault_policy_document.default.hcl
}

resource "vault_identity_entity" "default" {
  name     = var.application_name
  policies = ["default", vault_policy.default.name]
}

resource "vault_identity_entity_alias" "default" {
  name           = var.application_name
  mount_accessor = vault_auth_backend.default.accessor
  canonical_id   = vault_identity_entity.default.id
}
