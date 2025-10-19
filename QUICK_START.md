# Quick Start Guide

## Prerequisites

Before using this template, ensure you have:

- **[Terraform](https://terraform.io/downloads)** >= 1.0 installed
- **[Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)** installed
- Azure subscription with appropriate permissions

## Authentication Setup

1. **Login to Azure:**
   ```bash
   az login
   ```

2. **Verify your subscription:**
   ```bash
   az account show
   ```

3. **Set subscription if needed:**
   ```bash
   az account set --subscription "your-subscription-id"
   ```

## Try Your First Example (2 minutes)

### Simple Blob Storage Example

1. **Navigate to the example:**
   ```bash
   cd examples/azure-blob-storage
   ```

2. **Create your configuration:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

3. **Edit the configuration file:**
   ```bash
   # Edit terraform.tfvars with your preferred editor
   notepad terraform.tfvars  # Windows
   # or
   nano terraform.tfvars     # Linux/Mac
   ```

   Update these required values:
   ```hcl
   storage_account_name = "youruniquestorage123"  # Must be globally unique!
   ```

4. **Run Terraform:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

5. **Clean up when done:**
   ```bash
   terraform destroy
   ```

### Multi-Module Infrastructure Example

For a more comprehensive example with VM + Storage:

1. **Navigate to multi-module example:**
   ```bash
   cd examples/azure-multi-module
   ```

2. **Setup configuration:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

3. **Update required values:**
   ```hcl
   resource_group_name        = "my-project-rg"
   prefix                    = "myapp"
   admin_password            = "YourSecurePassword123!"
   storage_account_name      = "myappstorage123"      # Globally unique
   log_storage_account_name  = "myapplogs123"         # Globally unique
   ```

4. **Deploy infrastructure:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Common Issues & Solutions

### Storage Account Names
- **Must be globally unique** across all of Azure
- **3-24 characters**, lowercase letters and numbers only
- Try adding random numbers: `mycompany123`, `projectname456`

### Password Requirements
Azure VM passwords must contain:
- At least 12 characters
- Uppercase letters (A-Z)
- Lowercase letters (a-z)
- Numbers (0-9)
- Special characters (!@#$%^&*)

### Region Availability
If you get quota or availability errors, try different regions:
- `East US`
- `West Europe` 
- `Southeast Asia`

## Next Steps

- Read [TERRAFORM_BASICS.md](TERRAFORM_BASICS.md) to understand how it works
- Check [CUSTOMIZATION.md](CUSTOMIZATION.md) to adapt this template for your project
- Explore individual module READMEs for detailed configuration options
- Set up your own environments following the patterns in `environments/`