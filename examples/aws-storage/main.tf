terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "aws_storage" {
  source = "../../modules/aws-s3-storage"

  bucket_name       = var.bucket_name
  enable_versioning = true

  tags = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}
