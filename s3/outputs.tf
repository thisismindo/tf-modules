output "arn" {
  description = "S3 bucket ARN."
  value       = aws_s3_bucket.bucket.arn
}

output "bucket_domain_name" {
  description = "S3 bucket domain name."
  value       = aws_s3_bucket.bucket.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "S3 bucket regional domain name."
  value       = aws_s3_bucket.bucket.bucket_regional_domain_name
}
