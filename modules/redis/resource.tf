resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "redis_sg" {
  name        = "redis-security-group"
  description = "Security group for Redis"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.cluster_id
  engine               = "redis"
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  port                 = var.port
  security_group_ids   = [aws_security_group.redis_sg.id]
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
  snapshot_retention_limit = var.snapshot_retention_limit
  maintenance_window   = var.maintenance_window
}

resource "aws_elasticache_user" "redis_user" {
  user_id       = var.user_id
  user_name     = var.user_name
  access_string = "on ~* +@all"
  engine        = "REDIS"
  passwords     = []
  authentication_mode {
    type = "iam"
  }
}