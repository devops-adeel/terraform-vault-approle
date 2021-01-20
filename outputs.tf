output "approle_id" {
  description = "Approle ID"
  value       = data.vault_approle_auth_backend_role_id.default.role_id
}

output "approle_secret" {
  description = "Approle Secret ID"
  value       = vault_approle_auth_backend_role_secret_id.default.secret_id
  sensitive   = true
}

output "entity_id" {
  description = "The ID of the newly created Vault Identity Entity"
  value       = vault_identity_entity.default.id
}

output "group_id" {
  description = "The ID of the newly created Vault Identity Group"
  value       = vault_identity_group.default.id
}

output "backend_path" {
  description = "The Auth Backend path mounted upon"
  value       = local.vault_auth_backend
}
