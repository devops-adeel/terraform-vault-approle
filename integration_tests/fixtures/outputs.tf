output "approle_id" {
  description = "Approle ID"
  value       = module.default.approle_id
}

output "entity_id" {
  description = "The ID of the newly created Vault Identity Entity"
  value       = module.default.entity_id
}

output "group_id" {
  description = "The ID of the newly created Vault Identity Group"
  value       = module.default.group_id
}
