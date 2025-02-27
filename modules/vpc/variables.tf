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

# variable "private_subnets_cidrs" {
#   description = "Lista de blocos CIDR para as sub-redes privadas"
#   type = list(string)
# }

variable "availability_zones" {
  description = "Lista de zonas de disponibilidade para as sub-redes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "environment" {
  description = "Variável de ambiente"
  type        = string
  default     = "stg"
}

variable "name" {
  type = string
  default = "vpc"
}

variable "enable_nat_gw" {
  default = false
}