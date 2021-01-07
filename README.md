## Terraform Vault Approle Namespace Admin

This terraform module creates an approle ID to be used as a Vault Namespace admin.

## Requirements

N/A

## Providers

| Name | Version |
|------|---------|
| `vault` | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `application_name` | Name of the application/customer | `string` | n/a | yes |
| `vault_policies` | List of pre-defined vault policies | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| `approle_id` | Approle ID |
| `approle_secret` | Approle Secret ID |
