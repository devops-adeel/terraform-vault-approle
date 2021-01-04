output "approle_id" {
  description = "Approle ID"
  value       = data.vault_approle_auth_backend_role_id.default.role_id
}

output "approle_secret" {
  description = "Approle Secret ID"
  value       = vault_approle_auth_backend_role_secret_id.default.secret_id
  sensitive   = true
}
