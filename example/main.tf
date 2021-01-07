terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
  backend "remote" {
    organization = "example-org"

    workspaces {
      name = local.application_name
    }
  }
}

provider "vault" {
  address = "https://127.0.0.1:8200"
}

locals {
  application_name = "example-application"
}

resource "vault_namespace" "default" {
  path = local.application_name
}

provider "vault" {
  alias     = "default"
  namespace = trimsuffix(vault_namespace.default.id, "/")
}

module "vault_admin_policy" {
  source = "git::https://github.com/devops-adeel/terraform-vault-policy-ns-admin.git"
  providers = {
    vault = vault.default
  }
}

module "vault_approle" {
  source = "git::https://github.com/devops-adeel/terraform-vault-approle.git?ref=v0.2.0"
  providers = {
    vault = vault.default
  }
  application_name = local.application_name
  vault_policies = [module.vault_admin_policy.vault_policy_name]
}