# Azure Blob Storage Module

This module creates an Azure Storage Account with a Blob Container for object storage.

## Resources Created

- Resource Group
- Storage Account (with blob properties)
- Blob Container

## Usage

```hcl
module "azure_storage" {
  source = "../../modules/azure-blob-storage"

  resource_group_name      = "my-storage-rg"
  location                 = "East US"
  storage_account_name     = "mystorageacct123"
  container_name           = "myblobcontainer"
  container_access_type    = "private"
  blob_versioning_enabled  = true
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource_group_name | Name of the resource group | string | n/a | yes |
| storage_account_name | Name of the storage account | string | n/a | yes |
| location | Azure region for resources | string | "East US" | no |
| account_tier | Storage account tier | string | "Standard" | no |
| replication_type | Storage account replication type | string | "LRS" | no |
| container_name | Name of the blob container | string | "blobcontainer" | no |
| container_access_type | Access type for the container | string | "private" | no |
| blob_versioning_enabled | Enable blob versioning | bool | false | no |
| blob_delete_retention_days | Days to retain deleted blobs | number | 7 | no |
| container_delete_retention_days | Days to retain deleted containers | number | 7 | no |
| tags | Tags to apply to resources | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| storage_account_id | ID of the storage account |
| storage_account_name | Name of the storage account |
| primary_connection_string | Primary connection string (sensitive) |
| container_name | Name of the blob container |
| primary_blob_endpoint | Primary blob endpoint URL |
| primary_access_key | Primary access key (sensitive) |
