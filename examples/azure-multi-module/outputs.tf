# VM and Network Outputs
output "vm_private_ip_address" {
  description = "Private IP address of the virtual machine"
  value       = module.azure_vm_network.private_ip_address
}

output "public_ip_id" {
  description = "Public IP resource ID"
  value       = module.azure_vm_network.public_ip_id
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.azure_vm_network.vnet_id
}

output "vm_id" {
  description = "ID of the virtual machine"
  value       = module.azure_vm_network.vm_id
}

# Primary Storage Outputs
output "primary_storage_account_name" {
  description = "Name of the primary storage account"
  value       = module.azure_blob_storage.storage_account_name
}

output "primary_storage_container_name" {
  description = "Name of the primary storage container"
  value       = module.azure_blob_storage.container_name
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint URL"
  value       = module.azure_blob_storage.primary_blob_endpoint
}

# Log Storage Outputs
output "log_storage_account_name" {
  description = "Name of the log storage account"
  value       = module.azure_log_storage.storage_account_name
}

output "log_storage_container_name" {
  description = "Name of the log storage container"
  value       = module.azure_log_storage.container_name
}

output "log_blob_endpoint" {
  description = "Log blob endpoint URL"
  value       = module.azure_log_storage.primary_blob_endpoint
}

# Resource Group Output
output "resource_group_name" {
  description = "Name of the resource group"
  value       = var.resource_group_name
}

output "location" {
  description = "Azure region used"
  value       = var.location
}