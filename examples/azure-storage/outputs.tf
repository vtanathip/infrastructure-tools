output "storage_account_id" {
  description = "ID of the storage account"
  value       = module.azure_storage.storage_account_id
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = module.azure_storage.storage_account_name
}

output "container_name" {
  description = "Name of the blob container"
  value       = module.azure_storage.container_name
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint URL"
  value       = module.azure_storage.primary_blob_endpoint
}
