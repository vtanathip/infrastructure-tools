# Customizing This Template

## Overview

This template provides a solid foundation for Terraform-based infrastructure. Follow this guide to adapt it for your specific project needs.

## Repository Customization

### 1. After Using Template

When you first use this template:

1. **Update repository information:**
   - Change repository name and description
   - Update this README.md with your project details
   - Modify badges and links to point to your repository

2. **Review and customize default values:**
   - Edit `terraform.tfvars.example` files with your preferred defaults
   - Update naming conventions and tag standards
   - Adjust default regions and resource sizes

3. **Remove template-specific content:**
   - Delete or modify the "Using This Template" section in README.md
   - Remove this file if no longer needed

### 2. Recommended Project Structure

Organize your infrastructure code using this pattern:

```
your-infrastructure/
├── modules/              # Reusable Terraform modules (keep existing)
├── environments/         # Environment-specific configurations
│   ├── dev/             #   Development environment
│   ├── staging/         #   Staging environment
│   └── prod/            #   Production environment
├── examples/            # Keep for module testing and documentation
├── scripts/             # Deployment and utility scripts
├── .github/             # CI/CD workflows
└── docs/               # Additional documentation
```

### 3. Adding Environment Configurations

Create environment-specific folders:

```bash
mkdir -p environments/{dev,staging,prod}
```

Example `environments/dev/main.tf`:

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  
  # Optional: Configure remote state
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstate123"
    container_name      = "tfstate"
    key                = "dev/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Use your modules for actual environments
module "app_infrastructure" {
  source = "../../modules/azure-multi-module"
  
  resource_group_name        = "rg-myapp-dev"
  storage_account_name      = "stmyappdev${random_string.suffix.result}"
  log_storage_account_name  = "stmyappdevlogs${random_string.suffix.result}"
  prefix                   = "myapp-dev"
  location                 = "East US"
  
  tags = {
    Environment = "dev"
    Project     = "MyApp"
    CostCenter  = "Engineering"
    Owner       = "team@company.com"
  }
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}
```

## Adding New Modules

### 1. Create Module Structure

```bash
mkdir -p modules/your-new-module
cd modules/your-new-module
```

Create these files:
- `main.tf` - Resource definitions
- `variables.tf` - Input parameters
- `outputs.tf` - Return values
- `README.md` - Documentation

### 2. Module Template

**`modules/your-new-module/main.tf`:**
```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Add your resources here
```

**`modules/your-new-module/variables.tf`:**
```hcl
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

# Add your specific variables here
```

**`modules/your-new-module/outputs.tf`:**
```hcl
output "resource_group_id" {
  description = "ID of the resource group"
  value       = azurerm_resource_group.main.id
}

# Add your specific outputs here
```

### 3. Create Example Usage

```bash
mkdir -p examples/your-new-module-example
```

Follow the same pattern as existing examples with `main.tf`, `variables.tf`, `outputs.tf`, and `terraform.tfvars.example`.

### 4. Update CI/CD Pipeline

Add your new paths to `.github/workflows/terraform-validate.yml`:

```yaml
strategy:
  matrix:
    directory:
      - modules/your-new-module
      - examples/your-new-module-example
      # ... existing directories
```

Also update `scripts/test.sh`:

```bash
DIRS=(
    "modules/your-new-module"
    "examples/your-new-module-example"
    # ... existing directories
)
```

## Best Practices

### 1. Naming Conventions

Use consistent naming patterns:
- **Resources**: `rg-{project}-{environment}`, `st{project}{env}{random}`
- **Variables**: Use descriptive names with type and validation
- **Tags**: Always include Environment, Project, Owner, CostCenter

### 2. Security Considerations

- Never commit sensitive values to git
- Use Azure Key Vault for secrets in production
- Implement least-privilege access policies
- Enable logging and monitoring

### 3. Module Design

- Keep modules focused on single responsibility
- Use variables with good defaults and validation
- Provide comprehensive outputs
- Include detailed README documentation

### 4. State Management

For production environments, use remote state:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstate"
    container_name      = "tfstate"
    key                = "environment/terraform.tfstate"
  }
}
```

## Testing Your Changes

Always test new modules and changes:

```bash
# Format code
terraform fmt -recursive

# Validate syntax
./scripts/test.sh

# Test specific module
cd examples/your-new-module-example
terraform init
terraform plan
terraform apply
terraform destroy
```

## Documentation

Update documentation when making changes:
- Module README files with usage examples
- Root README.md with new module descriptions
- Comment complex resource configurations
- Document any special requirements or limitations