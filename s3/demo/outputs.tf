output "arn" {
  description = "S3 bucket ARN."
  value       = module.demo_s3_bucket.arn
}

output "bucket_domain_name" {
  description = "S3 bucket domain name."
  value       = module.demo_s3_bucket.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "S3 bucket regional domain name."
  value       = module.demo_s3_bucket.bucket_regional_domain_name
}
