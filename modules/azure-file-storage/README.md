# Azure File Storage Module

This module creates an Azure Storage Account with an Azure File Share.

## Resources Created

- Resource Group
- Storage Account
- File Share

## Usage

```hcl
module "azure_storage" {
  source = "../../modules/azure-file-storage"

  resource_group_name  = "my-storage-rg"
  location             = "East US"
  storage_account_name = "mystorageacct123"
  file_share_name      = "myfileshare"
  quota_gb             = 100
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource_group_name | Name of the resource group | string | n/a | yes |
| storage_account_name | Name of the storage account | string | n/a | yes |
| location | Azure region for resources | string | "East US" | no |
| quota_gb | File share quota in GB | number | 100 | no |

## Outputs

| Name | Description |
|------|-------------|
| storage_account_id | ID of the storage account |
| file_share_name | Name of the file share |
| file_share_url | URL of the file share |
