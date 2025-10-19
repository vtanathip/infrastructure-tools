# Azure Windows VM Example

This example demonstrates how to use the Azure VM and Network module.

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Create a `terraform.tfvars` file:
```hcl
admin_password = "YourSecurePassword123!"
```

3. Plan the deployment:
```bash
terraform plan
```

4. Apply the configuration:
```bash
terraform apply
```

5. Clean up resources:
```bash
terraform destroy
```

## Testing

To validate the configuration without creating resources:
```bash
terraform validate
terraform fmt -check
```
