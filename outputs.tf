output "approle_id" {
  description = "Approle ID"
  value       = local.role_id
}

output "approle_secret" {
  description = "Approle Secret ID"
  value       = vault_approle_auth_backend_role_secret_id.default.secret_id
  sensitive   = true
}

output "backend_path" {
  description = "The Auth Backend path mounted upon"
  value       = local.backend_path
}
