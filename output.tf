output "s3_bucket_name" {
  value       = module.s3.bucket_domain_name
  sensitive   = false
  description = "the name of the S3 bucket"
}

output "cdn_domain" {
  value       = module.cloudfront.cdn_domain_name
  sensitive   = false
  description = "the domain name of the CloudFront distribution"
}

output "access_key" {
  description = "access key of the IAM user"
  value       = module.iam.iam_access_key
  sensitive   = true
}

output "secret_key" {
  description = "secret key of the IAM user"
  value       = module.iam.iam_secret_key
  sensitive   = true
}