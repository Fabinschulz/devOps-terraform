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

# output to the IAM module
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

# output the ARN of the Redis role
output "redis_role_arn" {
  description = "ARN da Role para acesso ao Redis"
  value       = module.redis_role.role_arn
}

output "redis_endpoint_arn" {
  description = "Endpoint de conexão do Redis"
  value       = module.redis.redis_endpoint
}

output "redis_port_arn" {
  description = "Porta de conexão do Redis"
  value       = module.redis.redis_port
}

output "redis_vpc_id" {
  description = "ID da VPC onde o Redis foi criado"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs das subnets públicas"
  value       = module.vpc.public_subnet_ids
}