## Terraform Vault Approle

This terraform module creates an approle ID with and identity group associated to it.

## Status
![terraform-plan-approve-apply](https://github.com/devops-adeel/terraform-vault-approle/workflows/terraform-plan-approve-apply/badge.svg?branch=default)

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
| `service` | The name of the service attached to the principal approle | `string` | `"platform"` | no |

## Outputs

| Name | Description |
|------|-------------|
| `approle_id` | Approle ID |
| `approle_secret` | Approle Secret ID |
| `entity_id` | The ID of the newly created Vault Identity Entity |
| `group_id` | The ID of the newly created Vault Identity Group |
