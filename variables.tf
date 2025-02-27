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

# ------------------------- AWS Profile ------------------------------
variable "aws_profile" {
  description = "Profile da AWS para autenticação"
  type        = string
  default     = "AdministratorAccess-994954129201"
}

# ------------------------- Environment Variable ----------------------
variable "environment" {
  description = "Variável de ambiente"
  type        = string
  default     = "stg"
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

# ------------------- VPC -------------------------
variable "public_subnet_cidrs" {
  description = "Lista de blocos CIDR para as sub-redes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidrs" {
  description = "Lista de blocos CIDR para as sub-redes privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidade para as sub-redes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}