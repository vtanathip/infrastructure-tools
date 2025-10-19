terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # Configure remote state for staging environment
  # backend "azurerm" {
  #   resource_group_name  = "rg-terraform-state-staging"
  #   storage_account_name = "stterraformstatestaging"
  #   container_name      = "tfstate"
  #   key                = "staging/terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}

# Staging environment infrastructure using modules
module "app_infrastructure" {
  source = "../../modules/azure-vm-network"

  resource_group_name   = var.resource_group_name
  location              = var.location
  prefix                = var.prefix
  vnet_address_space    = "10.1.0.0/16"
  subnet_address_prefix = "10.1.1.0/24"

  # Staging-specific VM settings
  vm_size        = "Standard_B2s" # Larger than dev, smaller than prod
  admin_username = var.admin_username
  admin_password = var.admin_password
  windows_sku    = "2022-Datacenter"
  os_disk_type   = "Premium_LRS" # Premium storage for staging

  tags = local.common_tags
}

# Application data storage
module "app_storage" {
  source = "../../modules/azure-blob-storage"

  resource_group_name        = var.resource_group_name
  location                   = var.location
  storage_account_name       = "${var.storage_prefix}app${random_string.suffix.result}"
  container_name             = "app-data"
  container_access_type      = "private"
  blob_versioning_enabled    = true # Enabled for staging
  blob_delete_retention_days = 14   # Moderate retention for staging

  tags = local.common_tags
}

# Logs storage
module "log_storage" {
  source = "../../modules/azure-blob-storage"

  resource_group_name        = var.resource_group_name
  location                   = var.location
  storage_account_name       = "${var.storage_prefix}logs${random_string.suffix.result}"
  container_name             = "application-logs"
  container_access_type      = "private"
  blob_versioning_enabled    = false
  blob_delete_retention_days = 7 # Standard retention for staging logs

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
    Environment = "Staging"
    Project     = var.project_name
    ManagedBy   = "Terraform"
    CostCenter  = "Engineering"
    Owner       = var.owner_email
    CreatedDate = formatdate("YYYY-MM-DD", timestamp())
  }
}
