variable "application_name" {
  description = "Name of the application/customer"
  type        = string
}

variable "env" {
  description = "The environment name the identity principal will operate in"
  type        = string
  default     = "dev"
}

variable "service" {
  description = "The name of the service attached to the principal approle"
  type        = string
  default     = "platform"
}
