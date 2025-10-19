variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Name of the storage account (must be globally unique, 3-24 lowercase alphanumeric characters)"
  type        = string
}

variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}

variable "file_share_name" {
  description = "Name of the file share"
  type        = string
  default     = "fileshare"
}

variable "quota_gb" {
  description = "File share quota in GB"
  type        = number
  default     = 100
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
