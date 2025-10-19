# Environments

This directory contains environment-specific Terraform configurations that use the reusable modules from the `modules/` directory.

## Structure

```
environments/
├── dev/          # Development environment
├── staging/      # Staging environment  
└── prod/         # Production environment
```

Each environment contains:
- `main.tf` - Infrastructure configuration using modules
- `variables.tf` - Environment-specific variables and defaults
- `outputs.tf` - Important information from deployed resources
- `terraform.tfvars.example` - Example configuration values

## Usage

### Development Environment

```bash
cd environments/dev
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
terraform init
terraform plan
terraform apply
```

### Staging Environment

```bash
cd environments/staging
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
terraform init
terraform plan
terraform apply
```

### Production Environment

```bash
cd environments/prod
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
terraform init
terraform plan
terraform apply
```

## Environment Differences

| Aspect | Development | Staging | Production |
|--------|-------------|---------|------------|
| **VM Size** | Standard_B1s | Standard_B2s | Standard_D2s_v3 |
| **Storage Tier** | Standard_LRS | Premium_LRS | Premium_ZRS |
| **Blob Versioning** | Disabled | Enabled | Enabled |
| **Retention** | 3-7 days | 7-14 days | 30-90 days |
| **Network** | 10.0.x.x | 10.1.x.x | 10.2.x.x |

## Remote State (Recommended)

For production environments, configure remote state storage:

1. Create a storage account for Terraform state
2. Uncomment and configure the `backend` block in each environment's `main.tf`
3. Run `terraform init` to migrate state

Example backend configuration:
```hcl
backend "azurerm" {
  resource_group_name  = "rg-terraform-state"
  storage_account_name = "stterraformstate"
  container_name      = "tfstate"
  key                = "environment-name/terraform.tfstate"
}
```

## Security Considerations

- Never commit `terraform.tfvars` files with real passwords
- Use Azure Key Vault for production secrets
- Implement proper RBAC and network security groups
- Enable logging and monitoring for production environments
- Use different service principals for each environment

## Best Practices

1. **Test changes in dev first** before promoting to staging/prod
2. **Use consistent naming** across environments with appropriate prefixes
3. **Tag all resources** with environment, project, and owner information
4. **Monitor costs** especially in development environments
5. **Implement proper backup strategies** for production data