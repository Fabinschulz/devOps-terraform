# ------------------------- S3 Bucket Variables ----------------------
variable "bucket_state" {
  type        = string
  default     = "synthra-state-stg"
  description = "Bucket name for the state file"
}

# ------------------------- AWS Region -------------------------------
variable "aws_region" {
  description = "Região da AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

# ------------------------- Environment Variable ----------------------
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "stg"
}

# ------------------------- IAM Variables -----------------------------
variable "user_name" {
  description = "Nome do usuário IAM"
  type        = string
  default     = "synthra-user"
}

variable "policy_name" {
  description = "Nome da política IAM"
  type        = string
  default     = "synthra-policy"
}

variable "policy_document" {
  description = "Documento de política IAM em JSON"
  type        = string
  default     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets",
      "Resource": "*"
    }
  ]
}
EOF
}

# ------------------------- VPC Variables --------------------------
variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de blocos CIDR para as sub-redes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidade para as sub-redes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# ------------------- Redis role Variables -------------------------
variable "redis_role_name" {
  description = "Nome da Role para acesso ao Redis"
  type        = string
  default     = "RedisAccessRole"
}

variable "redis_policy_name" {
  description = "Nome da política de acesso ao Redis"
  type        = string
  default     = "RedisAccessPolicy"
}

# ------------------- Redis Variables -------------------------------
variable "redis_cluster_id" {
  description = "ID do cluster Redis"
  type        = string
  default     = "synthra-redis-cluster"
}

variable "redis_node_type" {
  description = "Tipo de nó do Redis"
  type        = string
  default     = "cache.t2.micro"
}

variable "redis_num_cache_nodes" {
  description = "Número de nós no cluster Redis"
  type        = number
  default     = 1
}

variable "redis_parameter_group_name" {
  description = "Nome do grupo de parâmetros do Redis"
  type        = string
  default     = "default.redis5.0"
}

variable "redis_engine_version" {
  description = "Versão do Redis"
  type        = string
  default     = "5.0.6"
}

variable "redis_port" {
  description = "Porta de conexão do Redis"
  type        = number
  default     = 6379
}

variable "allowed_cidr_blocks" {
  description = "Lista de blocos CIDR permitidos para acessar o Redis"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "redis_subnet_group_name" {
  description = "Nome do grupo de sub-redes para o Redis"
  type        = string
  default     = "redis-subnet-group"
}

variable "redis_snapshot_retention_limit" {
  description = "Número de dias para reter snapshots"
  type        = number
  default     = 7
}

variable "redis_maintenance_window" {
  description = "Janela de manutenção para o Redis"
  type        = string
  default     = "sun:05:00-sun:06:00"
}