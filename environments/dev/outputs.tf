# Infrastructure Outputs
output "resource_group_name" {
  description = "Name of the created resource group"
  value       = var.resource_group_name
}

output "vm_private_ip_address" {
  description = "Private IP address of the VM"
  value       = module.app_infrastructure.private_ip_address
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.app_infrastructure.vnet_id
}

output "vm_id" {
  description = "ID of the virtual machine"
  value       = module.app_infrastructure.vm_id
}

# Storage Outputs
output "app_storage_account_name" {
  description = "Name of the application storage account"
  value       = module.app_storage.storage_account_name
}

output "app_storage_blob_endpoint" {
  description = "Blob endpoint for application storage"
  value       = module.app_storage.primary_blob_endpoint
}

output "log_storage_account_name" {
  description = "Name of the log storage account"
  value       = module.log_storage.storage_account_name
}

output "log_storage_blob_endpoint" {
  description = "Blob endpoint for log storage"
  value       = module.log_storage.primary_blob_endpoint
}

# Useful information for development
output "environment_info" {
  description = "Development environment information"
  value = {
    environment = "Development"
    location    = var.location
    project     = var.project_name
    created_at  = timestamp()
  }
}
