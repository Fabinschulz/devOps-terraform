# Output para o ID do ElastiCache Replication Group
output "elasticache_replication_group_id" {
  description = "ID do ElastiCache Replication Group"
  value       = module.redis.elasticache_replication_group_id
}

# Output para o Endpoint Primário do ElastiCache Replication Group
output "elasticache_replication_group_primary_endpoint" {
  description = "Endpoint primário do ElastiCache Replication Group"
  value       = module.redis.elasticache_replication_group_primary_endpoint
}

# Output para o Endpoint de Leitura do ElastiCache Replication Group
output "elasticache_replication_group_reader_endpoint" {
  description = "Endpoint de leitura do ElastiCache Replication Group"
  value       = module.redis.elasticache_replication_group_reader_endpoint
}

#**** Output para o ARN do ElastiCache Replication Group *****
output "elasticache_replication_group_arn" {
  description = "ARN do ElastiCache Replication Group"
  value       = module.redis.elasticache_replication_group_arn
}

#**** Output para o ID do ElastiCache User*****
output "elasticache_user_id" {
  description = "ID do usuário do ElastiCache"
  value       = module.redis.elasticache_user_id
}

#**** Output para o ARN do ElastiCache User ****
output "elasticache_user_arn" {
  description = "ARN do usuário do ElastiCache"
  value       = module.redis.elasticache_user_arn
}

#***** Output para o ID do ElastiCache User Group****
output "elasticache_user_group_id" {
  description = "ID do grupo de usuários do ElastiCache"
  value       = module.redis.elasticache_user_group_id
}

#****** Output para o ARN do ElastiCache User Group*****
output "elasticache_user_group_arn" {
  description = "ARN do grupo de usuários do ElastiCache"
  value       = module.redis.elasticache_user_group_arn
}

#***** Output para o Nome do Subnet Group do ElastiCache*******
output "elasticache_subnet_group_name" {
  description = "Nome do Subnet Group do ElastiCache"
  value       = module.redis.elasticache_subnet_group_name
}

#******* Output para o ID do Security Group do ElastiCache *********
output "elasticache_security_group_id" {
  description = "ID do Security Group do ElastiCache"
  value       = module.redis.elasticache_security_group_id
}

output "elasticache_security_group_ingress_rules" {
  description = "Regras de ingress do Security Group do ElastiCache"
  value       = module.redis.elasticache_security_group_ingress_rules
}

output "elasticache_security_group_egress_rules" {
  description = "Regras de egress do Security Group do ElastiCache"
  value       = module.redis.elasticache_security_group_egress_rules
}

# # Output para o S3 Bucket Name
# output "s3_bucket_name" {
#   value       = module.s3.bucket_domain_name
#   sensitive   = false
#   description = "the name of the S3 bucket"
# }

# # Output para o CDN Domain
# output "cdn_domain" {
#   value       = module.cloudfront.cdn_domain_name
#   sensitive   = false
#   description = "the domain name of the CloudFront distribution"
# }


#****** Output para Function na IAM********
output "iam_role_name" {
  description = "Nome da IAM Role para a EC2"
  value       = module.function.role_name
}

output "iam_instance_profile_name" {
  description = "Nome do Instance Profile para a EC2"
  value       = module.function.instance_profile_name
}

#******* Output para IAM User*********
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

output "iam_role_arn" {
  description = "ARN da Role para acesso ao Redis"
  value       = module.iam.role_arn
}

#******** Output para o ID da VPC do Redis******
output "redis_vpc_id" {
  description = "ID da VPC onde o Redis foi criado"
  value       = module.vpc.vpc_id
}

#******* Output para os IDs das Subnets Públicas*******
output "public_subnet_ids" {
  description = "IDs das subnets públicas"
  value       = module.vpc.public_subnet_ids
}

#****** Output para os IDs das Subnets Privadas*******
# output "private_subnet_ids" {
#   description = "IDs das subnets privadas"
#   value       = module.vpc.private_subnet_ids
# }