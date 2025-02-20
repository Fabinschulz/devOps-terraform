output "redis_endpoint" {
  description = "Endpoint de conexão do Redis"
  value       = aws_elasticache_cluster.redis.configuration_endpoint
}

output "redis_port" {
  description = "Porta de conexão do Redis"
  value       = aws_elasticache_cluster.redis.port
}