output "storage_account_id" {
  description = "ID of the storage account"
  value       = module.azure_storage.storage_account_id
}

output "file_share_name" {
  description = "Name of the file share"
  value       = module.azure_storage.file_share_name
}

output "file_share_url" {
  description = "URL of the file share"
  value       = module.azure_storage.file_share_url
}
