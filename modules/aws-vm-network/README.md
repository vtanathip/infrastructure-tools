# AWS Windows VM and Network Module

This module creates a Windows EC2 instance with associated networking resources in AWS.

## Resources Created

- VPC
- Subnet
- Internet Gateway
- Route Table
- Security Group (with RDP access)
- EC2 Instance (Windows)

## Usage

```hcl
module "aws_vm" {
  source = "../../modules/aws-vm-network"

  prefix = "myvm"
  region = "us-east-1"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| prefix | Prefix for resource names | string | n/a | yes |
| region | AWS region | string | "us-east-1" | no |
| instance_type | EC2 instance type | string | "t3.medium" | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | ID of the EC2 instance |
| vpc_id | ID of the VPC |
| instance_public_ip | Public IP of the EC2 instance |
