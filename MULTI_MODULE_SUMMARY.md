# Multi-Module Azure Infrastructure Example

## Summary

Created a comprehensive example (`azure-multi-module`) that demonstrates how to use multiple Terraform modules together to build a complete Azure infrastructure solution.

## Components

### 1. **Infrastructure Created**
- **Azure VM with Network**: Windows Server 2022 with virtual network, subnet, public IP
- **Application Storage**: Blob storage with versioning for application data (30-day retention)
- **Log Storage**: Separate blob storage for logs (7-day retention)

### 2. **Files Created**
- `examples/azure-multi-module/main.tf` - Main configuration using multiple modules
- `examples/azure-multi-module/variables.tf` - Input variables
- `examples/azure-multi-module/outputs.tf` - Output values from all modules
- `examples/azure-multi-module/terraform.tfvars.example` - Example configuration

### 3. **Updated Files**
- `README.md` - Added multi-module example section with usage patterns
- `scripts/test.sh` - Added new example to validation script
- `.github/workflows/terraform-validate.yml` - Added to CI/CD pipeline

### 4. **Fixed Issues**
- Corrected `azurerm_storage_container` resource syntax
- Aligned output names with actual module outputs
- Validated configuration successfully

## Architecture Pattern

This example demonstrates a common production pattern:

```
Resource Group
├── Virtual Network + VM (compute layer)
├── Primary Storage Account (application data)
└── Log Storage Account (centralized logging)
```

## Usage

```hcl
# Copy terraform.tfvars.example to terraform.tfvars
# Update required values (storage account names, passwords)
terraform init
terraform plan
terraform apply
```

## Benefits

- **Modular Design**: Each component is independently manageable
- **Separation of Concerns**: Compute, storage, and logging are separated
- **Scalable Pattern**: Easy to extend with additional modules
- **Production Ready**: Includes retention policies and security configurations

The multi-module example showcases how to combine Terraform modules to create comprehensive, production-ready infrastructure solutions.