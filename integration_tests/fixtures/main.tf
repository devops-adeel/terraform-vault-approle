locals {
  application_name = "terraform-modules-development-approle"
  env              = "dev"
  service          = "web"
}

resource "vault_namespace" "default" {
  path = local.application_name
}

provider "vault" {
  alias     = "default"
  namespace = trimsuffix(vault_namespace.default.id, "/")
}

resource "vault_auth_backend" "default" {
  provider = vault.default
  type     = "approle"
  tune {
    max_lease_ttl     = "8760h"
    default_lease_ttl = "8760h"
  }
}

module "default" {
  source = "./module"
  providers = {
    vault = vault.default
  }
  application_name  = local.application_name
  env               = local.env
  service           = local.service
  mount_accessor    = vault_auth_backend.default.accessor
  identity_group_id = module.static_secrets.identity_group_id
}

module "static_secrets" {
  source = "git::https://github.com/devops-adeel/terraform-vault-secrets-kv.git?ref=v0.3.0"
}

resource "vault_approle_auth_backend_login" "default" {
  provider  = vault.default
  backend   = module.default.backend_path
  role_id   = module.default.approle_id
  secret_id = module.default.approle_secret
}
