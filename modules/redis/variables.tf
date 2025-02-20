variable "node_type" {
  description = "The instance type of the Redis nodes"
  type        = string
  default     = "cache.t2.micro"
}

variable "cluster_id" {
  description = "ID do cluster Redis"
  type        = string
  default     = "synthra-redis-cluster"
}

variable "num_cache_nodes" {
  description = "Número de nós no cluster Redis"
  type        = number
}

variable "parameter_group_name" {
  description = "Nome do grupo de parâmetros do Redis"
  type        = string
}

variable "engine_version" {
  description = "Versão do Redis"
  type        = string
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
}

variable "subnet_group_name" {
  description = "Nome do grupo de sub-redes para o Redis"
  type        = string
}

variable "subnet_ids" {
  description = "IDs das sub-redes para o Redis"
  type        = list(string)
}

variable "snapshot_retention_limit" {
  description = "Número de dias para reter snapshots"
  type        = number
}

variable "maintenance_window" {
  description = "Janela de manutenção para o Redis"
  type        = string
}