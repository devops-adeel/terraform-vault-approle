output "approle_id" {
  description = "Approle ID"
  value       = module.default.approle_id
}

output "approle_policies" {
  description = "List of policies attached to the approle login"
  value       = vault_approle_auth_backend_login.default.policies
}

/* output "entity_policies" { */
/*   description = "List of policies attached to the entity" */
/*   value = data.vault_identity_entity.default.policies */
/* } */

output "entity_id" {
  description = "The ID of the newly created Vault Identity Entity"
  value       = module.default.entity_id
}

output "group_id" {
  description = "The ID of the newly created Vault Identity Group"
  value       = module.default.group_id
}
