variable "user_name" {
  description = "Nome do usuário IAM"
  type        = string
  default     = "synthra-user"
}

variable "policy_name" {
  description = "Nome da política de acesso ao Redis"
  type        = string
  default     = "RedisAccessPolicy"
}

variable "role_name" {
  description = "Nome da Role"
  type        = string
  default     = "RedisAccessRole"
}