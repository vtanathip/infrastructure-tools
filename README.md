# Infrastructure Tools

A template repository for building cloud infrastructure on Azure and AWS using Terraform. This repository provides reusable, production-ready modules and examples to help you quickly set up infrastructure-as-code for your projects.

## 🚀 Using This Template

### Option 1: GitHub Template (Recommended)
1. Click the **"Use this template"** button at the top of this repository
2. Create your new repository from this template
3. Clone your new repository locally
4. Follow the [Quick Start Guide](QUICK_START.md)

### Option 2: Fork & Customize
1. Fork this repository to your account
2. Clone your fork locally
3. Customize modules and examples for your needs
4. See [Customization Guide](CUSTOMIZATION.md) for detailed instructions

## 📋 What You Get

After using this template, you'll have:
- **Production-ready Terraform modules** for common infrastructure patterns
- **Complete examples** showing how to use the modules
- **Environment structure** (dev/staging/prod) ready for your use
- **CI/CD pipeline** for automatic validation
- **Comprehensive documentation** to get started quickly

## Features

- **Multi-Cloud Support**: Azure and AWS providers
- **Modular Design**: Reusable Terraform modules
- **Two Key Scenarios**:
  1. Windows VM with networking (Azure & AWS)
  2. File storage services (Azure Files & AWS S3)
- **CI/CD Ready**: GitHub Actions workflow for validation
- **Best Practices**: Security, modularity, and minimal configuration

## Repository Structure

```
infrastructure-tools/
├── modules/                      # Reusable Terraform modules
│   ├── azure-vm-network/        # Azure Windows VM with network
│   ├── aws-vm-network/          # AWS Windows VM with network
│   ├── azure-blob-storage/      # Azure Blob Storage
│   └── aws-s3-storage/          # AWS S3 Storage
├── examples/                     # Usage examples for testing modules
│   ├── azure-vm/                # Azure VM example
│   ├── aws-vm/                  # AWS VM example
│   ├── azure-blob-storage/      # Azure blob storage example
│   ├── azure-multi-module/      # Multi-module Azure infrastructure
│   └── aws-storage/             # AWS storage example
├── environments/                 # Environment-specific configurations
│   ├── dev/                     # Development environment
│   ├── staging/                 # Staging environment
│   └── prod/                    # Production environment
├── scripts/                     # Utility scripts
├── .github/workflows/           # CI/CD workflows
└── docs/                        # Documentation
    ├── QUICK_START.md           # Getting started guide
    ├── TERRAFORM_BASICS.md      # Terraform fundamentals
    └── CUSTOMIZATION.md         # Template customization guide
```

## Modules

### Azure Windows VM and Network
Creates a complete Windows VM environment in Azure with:
- Resource Group
- Virtual Network & Subnet
- Network Security Group (RDP enabled)
- Public IP
- Network Interface
- Windows Virtual Machine

**Usage:**
```hcl
module "azure_vm" {
  source = "./modules/azure-vm-network"

  resource_group_name = "my-rg"
  location            = "East US"
  prefix              = "myvm"
  admin_password      = "SecurePassword123!"
}
```

### AWS Windows VM and Network
Creates a complete Windows EC2 environment in AWS with:
- VPC
- Subnet
- Internet Gateway & Route Table
- Security Group (RDP enabled)
- EC2 Instance (Windows Server)

**Usage:**
```hcl
module "aws_vm" {
  source = "./modules/aws-vm-network"

  prefix = "myvm"
  region = "us-east-1"
}
```

### Azure File Storage
Creates Azure Storage Account with File Share:
- Resource Group
- Storage Account
- File Share with configurable quota

**Usage:**
```hcl
module "azure_storage" {
  source = "./modules/azure-blob-storage"

  resource_group_name   = "my-storage-rg"
  storage_account_name  = "mystorageacct123"
  container_name        = "myblobcontainer"
  container_access_type = "private"
}
```

### AWS S3 Storage
Creates secure S3 bucket with:
- S3 Bucket
- Versioning (optional)
- Public access block (enabled)
- Server-side encryption

**Usage:**
```hcl
module "aws_storage" {
  source = "./modules/aws-s3-storage"

  bucket_name       = "my-unique-bucket-name"
  enable_versioning = true
}
```

## Multi-Module Infrastructure Example

The `azure-multi-module` example demonstrates how to combine multiple Terraform modules to create a comprehensive Azure infrastructure solution.

**Components deployed:**
- **Azure VM with Network**: Windows Server 2022 with virtual network, subnet, and public IP
- **Application Storage**: Blob storage for application data with versioning enabled
- **Log Storage**: Separate blob storage for application logs with shorter retention

**Usage:**
```hcl
# Creates VM + Network Infrastructure
module "azure_vm_network" {
  source = "../../modules/azure-vm-network"
  # VM and networking configuration
}

# Creates primary storage for application data
module "azure_blob_storage" {
  source = "../../modules/azure-blob-storage"
  # Storage with 30-day retention and versioning
}

# Creates separate storage for logs
module "azure_log_storage" {
  source = "../../modules/azure-blob-storage"
  # Log storage with 7-day retention
}
```

This example showcases infrastructure patterns commonly used in production environments where applications require compute resources, persistent storage, and centralized logging.

## 🔧 After Using This Template

Once you've created your repository from this template:

1. **Update repository information:**
   - Change repository name and description in GitHub
   - Update this README.md with your project-specific information
   - Modify the repository URL in clone commands below

2. **Customize for your project:**
   - Edit `terraform.tfvars.example` files with your preferred defaults
   - Update naming conventions in variables (change "myapp" prefixes)
   - Modify tags and resource names to match your organization's standards

3. **Remove template-specific sections:**
   - Delete the "Using This Template" section above
   - Remove this "After Using Template" section
   - Keep the rest of the documentation as reference

4. **Set up your environments:**
   - Navigate to `environments/dev/`, `environments/staging/`, `environments/prod/`
   - Configure each environment according to your needs
   - See [environments/README.md](environments/README.md) for guidance

## Quick Start

### Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- Azure CLI (for Azure resources)
- AWS CLI (for AWS resources)
- Appropriate cloud credentials configured

### Using a Module

1. **Clone this repository:**
```bash
git clone https://github.com/vtanathip/infrastructure-tools.git
cd infrastructure-tools
```

2. **Navigate to an example:**
```bash
cd examples/azure-vm
```

3. **Initialize Terraform:**
```bash
terraform init
```

4. **Create a `terraform.tfvars` file with required variables:**
```hcl
admin_password = "YourSecurePassword123!"
```

5. **Plan and apply:**
```bash
terraform plan
terraform apply
```

6. **Clean up:**
```bash
terraform destroy
```

## Testing

All modules and examples are validated using Terraform's built-in tools:

```bash
# Format check
terraform fmt -check

# Validation
terraform init -backend=false
terraform validate
```

### Automated Testing

Run the test script to validate all modules and examples:

```bash
./scripts/test.sh
```

The GitHub Actions workflow automatically runs these checks on every push and pull request.

## CI/CD

The repository includes a GitHub Actions workflow (`.github/workflows/terraform-validate.yml`) that:
- Validates Terraform syntax
- Checks formatting
- Runs on all modules and examples
- Triggers on push to main and pull requests

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests: `./scripts/test.sh`
5. Ensure all validation passes (`terraform fmt` and `terraform validate`)
6. Submit a pull request

## License

See [LICENSE](LICENSE) file for details.

## Support

For issues, questions, or contributions, please open an issue in this repository.
