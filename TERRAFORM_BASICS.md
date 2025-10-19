# Terraform Basics Guide

## What is Terraform?

Terraform is an **Infrastructure as Code (IaC)** tool that lets you define cloud resources using configuration files instead of clicking through web consoles. You write code describing what infrastructure you want, and Terraform creates it for you.

## Key Terraform Files

### `main.tf` - The Blueprint
This is where you define **what resources to create**:

```hcl
# Create a virtual machine
resource "azurerm_virtual_machine" "example" {
  name     = "my-vm"
  location = "East US"
  # ... other settings
}

# Use a reusable module
module "storage" {
  source = "./modules/azure-blob-storage"
  storage_account_name = "mystorageacct123"
}
```

### `variables.tf` - The Inputs
Define **configurable parameters** that make your infrastructure flexible:

```hcl
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"  # Optional default value
}
```

### `outputs.tf` - The Results
Show **important information** after resources are created:

```hcl
output "storage_account_name" {
  description = "Name of the created storage account"
  value       = azurerm_storage_account.main.name
}

output "website_url" {
  description = "URL to access your application"
  value       = "https://${azurerm_storage_account.main.name}.blob.core.windows.net"
}
```

### `terraform.tfvars` - Your Configuration
Provide **actual values** for your variables (never commit passwords!):

```hcl
storage_account_name = "mycompanystorage123"
location            = "West Europe"
admin_password      = "YourSecurePassword123!"
```

## Terraform Workflow

### 1. **Initialize** 📦
Downloads required plugins and modules:
```bash
terraform init
```

### 2. **Plan** 📋
Shows what Terraform will create/change (like a preview):
```bash
terraform plan
```

### 3. **Apply** 🚀
Creates the actual infrastructure:
```bash
terraform apply
```

### 4. **Destroy** 💥
Removes all created resources when done:
```bash
terraform destroy
```

## Modules Explained

**Modules** are like reusable templates. Instead of writing the same infrastructure code repeatedly:

```hcl
# Without modules - repetitive
resource "azurerm_storage_account" "app_storage" { ... }
resource "azurerm_storage_account" "log_storage" { ... }
resource "azurerm_storage_account" "backup_storage" { ... }

# With modules - reusable
module "app_storage" {
  source = "./modules/azure-blob-storage"
  storage_account_name = "appdata123"
}

module "log_storage" {
  source = "./modules/azure-blob-storage"  
  storage_account_name = "logs123"
}
```

## Why This Matters

1. **Consistency**: Same infrastructure every time
2. **Version Control**: Track changes like code
3. **Collaboration**: Team can work together
4. **Automation**: No manual clicking in consoles
5. **Documentation**: Infrastructure is self-documenting

## Running Examples in This Repository

1. **Pick an example**: Navigate to `examples/azure-vm/` or `examples/azure-multi-module/`

2. **Copy the template**: 
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

3. **Edit your values**: Open `terraform.tfvars` and update:
   - Storage account names (must be globally unique)
   - Passwords and sensitive data
   - Regions and sizes

4. **Run the workflow**:
   ```bash
   terraform init    # Download dependencies
   terraform plan    # Preview changes  
   terraform apply   # Create infrastructure
   ```

5. **Clean up when done**:
   ```bash
   terraform destroy  # Remove everything
   ```

## Common Gotchas

- **Storage account names** must be globally unique across all of Azure
- **Passwords** need uppercase, lowercase, numbers, and symbols  
- **Never commit** `terraform.tfvars` with real passwords to git
- **Always run** `terraform plan` before `apply` to see what will happen

## Next Steps

- Start with simple examples like `azure-blob-storage`
- Try the `azure-multi-module` example to see how modules work together
- Read individual module README files for specific configuration options
- Check Azure documentation for resource-specific requirements