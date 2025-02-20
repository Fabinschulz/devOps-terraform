variable "user_name" {
  description = "Nome do usuário IAM"
  type        = string
}

variable "policy_name" {
  description = "Nome da política IAM"
  type        = string
}

variable "policy_document" {
  description = "Documento de política IAM em JSON"
  type        = string
}