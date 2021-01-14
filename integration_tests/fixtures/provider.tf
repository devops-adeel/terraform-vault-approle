terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
  backend "remote" {
    organization = "hc-implementation-services"
    workspaces {
      name = "terraform-modules-development"
    }
  }
}
