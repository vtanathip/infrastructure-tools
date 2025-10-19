# Azure Windows VM and Network Module

This module creates a Windows virtual machine with associated networking resources in Azure.

## Resources Created

- Resource Group
- Virtual Network
- Subnet
- Network Security Group (with RDP access)
- Public IP
- Network Interface
- Windows Virtual Machine

## Usage

```hcl
module "azure_vm" {
  source = "../../modules/azure-vm-network"

  resource_group_name = "my-rg"
  location            = "East US"
  prefix              = "myvm"
  admin_password      = "SecurePassword123!"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource_group_name | Name of the resource group | string | n/a | yes |
| location | Azure region for resources | string | "East US" | no |
| prefix | Prefix for resource names | string | n/a | yes |
| admin_password | Admin password for the VM | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vm_id | ID of the virtual machine |
| vnet_id | ID of the virtual network |
| private_ip_address | Private IP address of the VM |
