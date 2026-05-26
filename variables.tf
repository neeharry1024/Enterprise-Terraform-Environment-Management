variable "environment" {
  description = "Deployment environment"

  type = string

  validation {
    condition = contains(
      ["dev", "test", "prod"],
      var.environment
    )

    error_message = "Environment must be dev, test, or prod."
  }
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vm_size" {
  type        = string
  description = "VM size"
}

variable "admin_username" {
  type        = string
  description = "VM admin username"

  validation {
    condition     = length(var.admin_username) >= 4
    error_message = "Admin username must be at least 4 characters."
  }
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "VM password"

  validation {
    condition     = length(var.admin_password) >= 12
    error_message = "Password must be at least 12 characters."
  }
}

variable "enable_public_ip" {
  type        = bool
  description = "Enable public IP"
}

variable "enable_storage_account" {
  type        = bool
  description = "Create storage account"
}
