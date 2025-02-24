variable "node_type" {
  description = "The instance type of the Redis nodes"
  type        = string
  default     = "cache.t2.micro"
}

variable "parameter_group_name" {
  description = "Nome do grupo de parâmetros do Redis"
  type        = string
  default     = "default.redis7.cluster.on"
}

variable "engine_version" {
  description = "Versão do Redis"
  type        = string
  default     = "7.0"
}

variable "port" {
  description = "Porta de conexão do Redis"
  type        = number
  default     = 6379
}

variable "vpc_id" {
  description = "ID da VPC onde o Redis será criado"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "Lista de blocos CIDR permitidos para acessar o Redis"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_group_name" {
  description = "Nome do grupo de sub-redes para o Redis"
  type        = string
  default     = "redis-subnet-group"
}

variable "subnet_ids" {
  description = "IDs das sub-redes para o Redis"
  type        = list(string)
}

variable "user_id" {
  description = "ID do usuário do ElastiCache"
  type        = string
  default     = "synthra-user"
}

variable "user_name" {
  description = "Nome do usuário do ElastiCache"
  type        = string
  default     = "synthra-user"
}

variable "replication_group_id" {
  description = "ID do grupo de replicação do ElastiCache"
  type        = string
  default     = "synthra-replication-group"
}

variable "sg_ingress_rule_source_security_group_ids" {
  type = list(string)
}

variable "sg_ingress_rule_source_cidr" {
  type    = list(string)
  default = []
}