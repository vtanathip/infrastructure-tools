output "vm_id" {
  description = "ID of the virtual machine"
  value       = module.azure_vm.vm_id
}

output "vm_name" {
  description = "Name of the virtual machine"
  value       = module.azure_vm.vm_name
}

output "private_ip_address" {
  description = "Private IP address of the VM"
  value       = module.azure_vm.private_ip_address
}
