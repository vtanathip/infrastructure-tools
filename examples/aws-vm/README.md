# AWS Windows VM Example

This example demonstrates how to use the AWS VM and Network module.

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
