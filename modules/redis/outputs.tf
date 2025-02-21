output "redis_endpoint" {
  value = aws_elasticache_cluster.redis.cache_nodes[0].address
  description = "Endpoint de conexão do Redis"
}

output "redis_port" {
  description = "Porta de conexão do Redis"
  value       = aws_elasticache_cluster.redis.port
}