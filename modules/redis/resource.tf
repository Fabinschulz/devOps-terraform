# Criação do ElastiCache User com autenticação IAM
resource "aws_elasticache_user" "user" {
  access_string = "on ~* +@all"
  engine        = "REDIS"
  user_id       = var.user_id
  user_name     = var.user_name

  authentication_mode {
    type = "iam"
  }
}

# Criação do ElastiCache User Group
resource "aws_elasticache_user_group" "this" {
  engine        = "REDIS"
  user_group_id = "user-group-master"
  user_ids      = [aws_elasticache_user.user.id, "default"]
}

# Criação do Subnet Group para ElastiCache
resource "aws_elasticache_subnet_group" "this" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids
}

# Criação do ElastiCache Replication Group (Cluster)
resource "aws_elasticache_replication_group" "this" {
  replication_group_id          = var.replication_group_id
  description = "Synthra replication group"
  node_type                     = var.node_type
  engine                        = "redis"
  engine_version                = var.engine_version
  parameter_group_name          = var.parameter_group_name
  automatic_failover_enabled    = true
  num_node_groups               = 1
  replicas_per_node_group       = 1
  security_group_ids            = [aws_security_group.this.id]
  subnet_group_name             = aws_elasticache_subnet_group.this.name
  port                          = var.port
  
  transit_encryption_enabled    = true
  at_rest_encryption_enabled    = true
  user_group_ids                = [aws_elasticache_user_group.this.user_group_id]

  multi_az_enabled              = true
  snapshot_retention_limit      = 7
  maintenance_window            = "sun:05:00-sun:09:00"
}


# Criação do Security Group para ElastiCache
resource "aws_security_group" "this" {
  name        = "redis-security-group"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "security-group-v1"
  }

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.my_ip.response_body)}/32"]
  }

 # Tráfego de saída
  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

 # Tráfego de saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "ingress_from_cidr" {
  count             = length(var.sg_ingress_rule_source_cidr) > 0 ? 1 : 0
  from_port         = var.port
  protocol          = "tcp"
  cidr_blocks       = var.sg_ingress_rule_source_cidr
  to_port           = var.port
  type              = "ingress"
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "ingress_from_source_sg_id" {
  count                    = length(var.sg_ingress_rule_source_security_group_ids)
  from_port                = var.port
  protocol                 = "tcp"
  source_security_group_id = element(var.sg_ingress_rule_source_security_group_ids, count.index)
  to_port                  = var.port
  type                     = "ingress"
  security_group_id        = aws_security_group.this.id
}