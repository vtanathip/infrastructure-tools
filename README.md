# Infrastructure Tools

A template repository for initializing cloud resources on Azure and AWS using Terraform. This repository provides reusable, modular, and testable infrastructure-as-code components.

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
│   ├── azure-file-storage/      # Azure File Storage
│   └── aws-s3-storage/          # AWS S3 Storage
├── examples/                     # Example configurations
│   ├── azure-vm/                # Azure VM example
│   ├── aws-vm/                  # AWS VM example
│   ├── azure-storage/           # Azure storage example
│   └── aws-storage/             # AWS storage example
└── .github/workflows/           # CI/CD workflows
    └── terraform-validate.yml   # Terraform validation workflow
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
  source = "./modules/azure-file-storage"

  resource_group_name  = "my-storage-rg"
  storage_account_name = "mystorageacct123"
  file_share_name      = "myfileshare"
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
