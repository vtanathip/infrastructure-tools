terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# VM with Network Infrastructure
module "azure_vm_network" {
  source = "../../modules/azure-vm-network"

  resource_group_name   = var.resource_group_name
  location              = var.location
  prefix                = var.prefix
  vnet_address_space    = "10.0.0.0/16"
  subnet_address_prefix = "10.0.1.0/24"

  # VM Configuration
  vm_size        = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password
  windows_sku    = "2022-Datacenter"
  os_disk_type   = "Premium_LRS"

  tags = var.tags
}

# Blob Storage for application data and backups
module "azure_blob_storage" {
  source = "../../modules/azure-blob-storage"

  resource_group_name        = var.resource_group_name
  location                   = var.location
  storage_account_name       = var.storage_account_name
  container_name             = "appdata"
  container_access_type      = "private"
  blob_versioning_enabled    = true
  blob_delete_retention_days = 30

  tags = var.tags
}

# Additional storage container for logs
module "azure_log_storage" {
  source = "../../modules/azure-blob-storage"

  resource_group_name        = var.resource_group_name
  location                   = var.location
  storage_account_name       = var.log_storage_account_name
  container_name             = "applicationlogs"
  container_access_type      = "private"
  blob_versioning_enabled    = false
  blob_delete_retention_days = 7

  tags = merge(var.tags, {
    Purpose = "Logging"
  })
}
