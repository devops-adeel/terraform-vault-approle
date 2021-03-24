![inspec-test](https://github.com/devops-adeel/terraform-vault-approle/actions/workflows/terraform-apply.yml/badge.svg)

## Terraform Vault Approle

This terraform module creates an approle ID with and identity group
associated to it.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Usage:

```hcl

module "vault_approle" {
  source           = "git::https://github.com/devops-adeel/terraform-vault-approle.git?ref=v0.6.0"
  application_name = local.application_name
  env              = "dev"
  service          = "web"
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_approle_auth_backend_role.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role) | resource |
| [vault_approle_auth_backend_role_secret_id.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role_secret_id) | resource |
| [vault_identity_entity.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_entity) | resource |
| [vault_identity_entity_alias.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_entity_alias) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | Name of the application/customer | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment name the identity principal will operate in | `string` | `"dev"` | no |
| <a name="input_mount_accessor"></a> [mount\_accessor](#input\_mount\_accessor) | The Accessor ID of the Approle Auth Backend. | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | The name of the service attached to the principal approle | `string` | `"platform"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_approle_id"></a> [approle\_id](#output\_approle\_id) | Approle ID |
| <a name="output_approle_secret"></a> [approle\_secret](#output\_approle\_secret) | Approle Secret ID |
| <a name="output_backend_path"></a> [backend\_path](#output\_backend\_path) | The Auth Backend path mounted upon |
| <a name="output_entity_id"></a> [entity\_id](#output\_entity\_id) | The ID of the newly created Vault Identity Entity |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
