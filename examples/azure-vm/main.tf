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

module "azure_vm" {
  source = "../../modules/azure-vm-network"

  resource_group_name = "example-vm-rg"
  location            = "East US"
  prefix              = "example"
  admin_password      = var.admin_password

  tags = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}
