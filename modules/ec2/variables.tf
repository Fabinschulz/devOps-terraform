variable "server_certificate_arn" {
  description = "ARN do certificado do servidor VPN"
  type        = string
}

variable "client_cidr_block" {
  description = "Bloco CIDR para os clientes VPN"
  type        = string
}

variable "root_certificate_chain_arn" {
  description = "ARN da cadeia de certificados raiz"
  type        = string
}

variable "security_group_id" {
  description = "ID do grupo de segurança associado ao endpoint VPN"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde o endpoint VPN será criado"
  type        = string
}

variable "public_subnet_id" {
  description = "ID da subnet pública para associação ao endpoint VPN"
  type        = string
}