# Output para o ID do ElastiCache Replication Group
output "elasticache_replication_group_id" {
  description = "ID do ElastiCache Replication Group"
  value       = aws_elasticache_replication_group.this.id
}

# Output para o Endpoint Primário do ElastiCache Replication Group
output "elasticache_replication_group_primary_endpoint" {
  description = "Endpoint primário do ElastiCache Replication Group"
  value       = aws_elasticache_replication_group.this.primary_endpoint_address
}

# Output para o Endpoint de Leitura do ElastiCache Replication Group
output "elasticache_replication_group_reader_endpoint" {
  description = "Endpoint de leitura do ElastiCache Replication Group"
  value       = aws_elasticache_replication_group.this.reader_endpoint_address
}

# Output para o ARN do ElastiCache Replication Group
output "elasticache_replication_group_arn" {
  description = "ARN do ElastiCache Replication Group"
  value       = aws_elasticache_replication_group.this.arn
}

# Output para o ID do ElastiCache User
output "elasticache_user_id" {
  description = "ID do usuário do ElastiCache"
  value       = aws_elasticache_user.user.id
}

# Output para o ARN do ElastiCache User
output "elasticache_user_arn" {
  description = "ARN do usuário do ElastiCache"
  value       = aws_elasticache_user.user.arn
}

# Output para o ID do ElastiCache User Group
output "elasticache_user_group_id" {
  description = "ID do grupo de usuários do ElastiCache"
  value       = aws_elasticache_user_group.this.user_group_id
}

# Output para o ARN do ElastiCache User Group
output "elasticache_user_group_arn" {
  description = "ARN do grupo de usuários do ElastiCache"
  value       = aws_elasticache_user_group.this.arn
}

# Output para o Nome do Subnet Group do ElastiCache
output "elasticache_subnet_group_name" {
  description = "Nome do Subnet Group do ElastiCache"
  value       = aws_elasticache_subnet_group.this.name
}

# Output para o ID do Security Group do ElastiCache
output "elasticache_security_group_id" {
  description = "ID do Security Group do ElastiCache"
  value       = aws_security_group.this.id
}

# Output para as Regras de Ingress do Security Group
output "elasticache_security_group_ingress_rules" {
  description = "Regras de ingress do Security Group do ElastiCache"
  value = [
    for rule in aws_security_group.this.ingress :
    {
      from_port   = rule.from_port
      to_port     = rule.to_port
      protocol    = rule.protocol
      cidr_blocks = rule.cidr_blocks
    }
  ]
}

# Output para as Regras de Egress do Security Group
output "elasticache_security_group_egress_rules" {
  description = "Regras de egress do Security Group do ElastiCache"
  value = [
    for rule in aws_security_group.this.egress :
    {
      from_port   = rule.from_port
      to_port     = rule.to_port
      protocol    = rule.protocol
      cidr_blocks = rule.cidr_blocks
    }
  ]
}