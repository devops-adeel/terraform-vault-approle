## Requirements

Vault provider aliased `default` is declared like below example:

```
provider "vault" {
  alias     = "default"
  namespace = vault_namespace.default.path
}
```

## Providers

| Name | Version |
|------|---------|
| `vault` | n/a |
| `vault.default` | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `application_name` | Name of the application/customer | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `approle_id` | Approle ID |
| `approle_secret` | Approle Secret ID |
