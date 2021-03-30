## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |
| <a name="provider_vault.default"></a> [vault.default](#provider\_vault.default) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_default"></a> [default](#module\_default) | ./module |  |
| <a name="module_static_secrets"></a> [static\_secrets](#module\_static\_secrets) | git::https://github.com/devops-adeel/terraform-vault-secrets-kv.git?ref=feature/member-entity-id |  |

## Resources

| Name | Type |
|------|------|
| [vault_approle_auth_backend_login.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_login) | resource |
| [vault_auth_backend.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_namespace.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | Vault Address | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_approle_id"></a> [approle\_id](#output\_approle\_id) | Approle ID |
| <a name="output_approle_policies"></a> [approle\_policies](#output\_approle\_policies) | List of policies attached to the approle login |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | Vault Namespace |
| <a name="output_path"></a> [path](#output\_path) | Vault API Endpoint |
| <a name="output_token"></a> [token](#output\_token) | Vault Client Token |
| <a name="output_url"></a> [url](#output\_url) | Vault URL Address |
