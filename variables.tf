variable "application_name" {
  description = "Name of the application/customer"
  type        = string
}

variable "vault_policy_name" {
  description = "Name of a pre-defined vault policy"
  type = string
  default = ""
}
