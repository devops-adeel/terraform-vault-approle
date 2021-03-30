output "approle_id" {
  description = "Approle ID"
  value       = module.default.approle_id
}

output "approle_policies" {
  description = "List of policies attached to the approle login"
  value       = vault_approle_auth_backend_login.default.policies
}

output "token" {
  description = "Vault Client Token"
  value       = vault_approle_auth_backend_login.default.client_token
}

output "url" {
  description = "Vault URL Address"
  value       = var.vault_address
}

output "namespace" {
  description = "Vault Namespace"
  value       = format("admin/%s/", local.application_name)
}

output "path" {
  description = "Vault API Endpoint"
  value       = "auth/token/lookup-self"
}
