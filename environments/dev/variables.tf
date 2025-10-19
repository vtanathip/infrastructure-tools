variable "resource_group_name" {
  description = "Name of the resource group for development environment"
  type        = string
  default     = "rg-myapp-dev"
}

variable "location" {
  description = "Azure region for development resources"
  type        = string
  default     = "East US"
}

variable "prefix" {
  description = "Prefix for resource names in development"
  type        = string
  default     = "myapp-dev"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "MyApplication"
}

variable "storage_prefix" {
  description = "Prefix for storage account names (must be lowercase, no special chars)"
  type        = string
  default     = "myappdev"
}

variable "admin_username" {
  description = "Administrator username for the VM"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "Administrator password for the VM"
  type        = string
  sensitive   = true
}

variable "owner_email" {
  description = "Email of the resource owner"
  type        = string
  default     = "team@company.com"
}
