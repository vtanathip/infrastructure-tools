output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = module.aws_storage.bucket_id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = module.aws_storage.bucket_arn
}

output "bucket_domain_name" {
  description = "Domain name of the S3 bucket"
  value       = module.aws_storage.bucket_domain_name
}
