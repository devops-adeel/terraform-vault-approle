variable "application_name" {
  description = "Name of the application/customer"
  type        = string
}

variable "vault_policies" {
  description = "List of pre-defined vault policies"
  type        = list(any)
  default     = []
}
