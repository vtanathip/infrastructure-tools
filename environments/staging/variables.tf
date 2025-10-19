variable "resource_group_name" {
  description = "Name of the resource group for staging environment"
  type        = string
  default     = "rg-myapp-staging"
}

variable "location" {
  description = "Azure region for staging resources"
  type        = string
  default     = "East US"
}

variable "prefix" {
  description = "Prefix for resource names in staging"
  type        = string
  default     = "myapp-staging"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "MyApplication"
}

variable "storage_prefix" {
  description = "Prefix for storage account names (must be lowercase, no special chars)"
  type        = string
  default     = "myappstaging"
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
