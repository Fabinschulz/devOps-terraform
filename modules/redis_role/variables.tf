variable "role_name" {
  description = "Nome da Role"
  type        = string
  default     = "RedisAccessRole"
}

variable "policy_name" {
  description = "Nome da política de acesso ao Redis"
  type        = string
  default     = "RedisAccessPolicy"
}