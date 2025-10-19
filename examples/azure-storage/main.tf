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
  source = "../../modules/azure-file-storage"

  resource_group_name  = "example-storage-rg"
  location             = "East US"
  storage_account_name = var.storage_account_name
  file_share_name      = "exampleshare"
  quota_gb             = 100

  tags = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}
