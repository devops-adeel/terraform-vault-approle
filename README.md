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
| `env` | The environment name the identity principal will operate in | `string` | `"dev"` | no |
| `service` | The name of the service attached to the principal approle | `string` | `"web"` | no |

## Outputs

| Name | Description |
|------|-------------|
| `approle_id` | Approle ID |
| `approle_secret` | Approle Secret ID |
| `entity_id` | The ID of the newly created Vault Identity Entity |
