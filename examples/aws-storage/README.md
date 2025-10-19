# AWS S3 Storage Example

This example demonstrates how to use the AWS S3 Storage module.

## Usage

1. Configure AWS credentials:
```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
```

2. Initialize Terraform:
```bash
terraform init
```

3. Create a `terraform.tfvars` file:
```hcl
bucket_name = "your-unique-bucket-name"
```

4. Plan the deployment:
```bash
terraform plan
```

5. Apply the configuration:
```bash
terraform apply
```

6. Clean up resources:
```bash
terraform destroy
```

## Testing

To validate the configuration without creating resources:
```bash
terraform validate
terraform fmt -check
```
