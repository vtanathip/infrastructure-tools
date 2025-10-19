terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # Uncomment and configure for remote state in production
  # backend "azurerm" {
  #   resource_group_name  = "rg-terraform-state-dev"
  #   storage_account_name = "stterraformstatedev"
  #   container_name      = "tfstate"
  #   key                = "dev/terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}

# Development environment infrastructure using modules
module "app_infrastructure" {
  source = "../../modules/azure-vm-network"

  resource_group_name     = var.resource_group_name
  location               = var.location
  prefix                 = var.prefix
  vnet_address_space     = "10.0.0.0/16"
  subnet_address_prefix  = "10.0.1.0/24"
  
  # Development-specific VM settings
  vm_size        = "Standard_B1s"  # Smaller size for dev
  admin_username = var.admin_username
  admin_password = var.admin_password
  windows_sku    = "2022-Datacenter"
  os_disk_type   = "Standard_LRS"  # Standard storage for dev
  
  tags = local.common_tags
}

# Application data storage
module "app_storage" {
  source = "../../modules/azure-blob-storage"

  resource_group_name         = var.resource_group_name
  location                   = var.location
  storage_account_name       = "${var.storage_prefix}app${random_string.suffix.result}"
  container_name             = "app-data"
  container_access_type      = "private"
  blob_versioning_enabled    = false  # Disabled for dev to save costs
  blob_delete_retention_days = 7       # Shorter retention for dev
  
  tags = local.common_tags
}

# Logs storage
module "log_storage" {
  source = "../../modules/azure-blob-storage"

  resource_group_name         = var.resource_group_name
  location                   = var.location
  storage_account_name       = "${var.storage_prefix}logs${random_string.suffix.result}"
  container_name             = "application-logs"
  container_access_type      = "private"
  blob_versioning_enabled    = false
  blob_delete_retention_days = 3       # Very short retention for dev logs
  
  tags = merge(local.common_tags, {
    Purpose = "Logging"
  })
}

# Generate random suffix for globally unique names
resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

# Common tags for all resources
locals {
  common_tags = {
    Environment    = "Development"
    Project       = var.project_name
    ManagedBy     = "Terraform"
    CostCenter    = "Engineering"
    Owner         = var.owner_email
    CreatedDate   = formatdate("YYYY-MM-DD", timestamp())
  }
}