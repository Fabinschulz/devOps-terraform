output "cdn_id" {
  value       = data.aws_cloudfront_distribution.s3_cloudfront.id
  sensitive   = false
  description = "The CloudFront distribution id"
}

output "cdn_domain_name" {
  value       = data.aws_cloudfront_distribution.s3_cloudfront.domain_name
  sensitive   = false
  description = "The CloudFront distribution domain name"
}