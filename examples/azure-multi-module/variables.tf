variable "resource_group_name" {
  description = "Name of the resource group for all resources"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "East US"
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Administrator username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Administrator password for the VM"
  type        = string
  sensitive   = true
}

variable "storage_account_name" {
  description = "Name of the primary storage account (must be globally unique)"
  type        = string
}

variable "log_storage_account_name" {
  description = "Name of the logging storage account (must be globally unique)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "MultiModule"
    ManagedBy   = "Terraform"
  }
}
