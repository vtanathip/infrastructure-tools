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

module "aws_vm" {
  source = "../../modules/aws-vm-network"

  prefix = "example"
  region = var.region

  tags = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}
