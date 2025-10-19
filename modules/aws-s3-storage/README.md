# AWS S3 Storage Module

This module creates an AWS S3 bucket with security best practices enabled.

## Resources Created

- S3 Bucket
- Bucket Versioning
- Public Access Block
- Server-Side Encryption

## Usage

```hcl
module "aws_storage" {
  source = "../../modules/aws-s3-storage"

  bucket_name       = "my-unique-bucket-name"
  enable_versioning = true
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket_name | Name of the S3 bucket | string | n/a | yes |
| enable_versioning | Enable versioning | bool | false | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | ID of the S3 bucket |
| bucket_arn | ARN of the S3 bucket |
| bucket_domain_name | Domain name of the S3 bucket |
