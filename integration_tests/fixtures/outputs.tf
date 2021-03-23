output "approle_id" {
  description = "Approle ID"
  value       = module.default.approle_id
}

output "approle_policies" {
  description = "List of policies attached to the approle login"
  value       = vault_approle_auth_backend_login.default.policies
}

output "entity_id" {
  description = "The ID of the newly created Vault Identity Entity"
  value       = module.default.entity_id
}

output "group_id" {
  description = "The ID of the newly created Vault Identity Group"
  value       = module.default.group_id
}

output "token" {
  value = vault_approle_auth_backend_login.default.client_token
}

output "url" {
  value = var.vault_address
}

output "namespace" {
  value = format("admin/%s/", local.application_name)
}

output "path" {
  value = "auth/token/lookup-self"
}
