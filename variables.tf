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