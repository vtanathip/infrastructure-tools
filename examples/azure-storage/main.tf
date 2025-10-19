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

module "azure_storage" {
  source = "../../modules/azure-blob-storage"

  resource_group_name         = "example-storage-rg"
  location                    = "East US"
  storage_account_name        = var.storage_account_name
  container_name              = "examplecontainer"
  container_access_type       = "private"
  blob_versioning_enabled     = true
  blob_delete_retention_days  = 14

  tags = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}
