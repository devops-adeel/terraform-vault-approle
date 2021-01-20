locals {
  application_name = "terraform-modules-development-approle"
}

resource "vault_namespace" "default" {
  path = local.application_name
}

provider "vault" {
  alias     = "default"
  namespace = trimsuffix(vault_namespace.default.id, "/")
}

module "default" {
  source = "./module"
  providers = {
    vault = vault.default
  }
  application_name = local.application_name
  env              = "dev"
  service          = "web"
}

resource "vault_approle_auth_backend_login" "default" {
  provider  = vault.default
  backend   = module.default.backend_path
  role_id   = module.default.approle_id
  secret_id = module.default.approle_secret
}
