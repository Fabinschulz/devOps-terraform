output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "IDs das sub-redes públicas"
  value       = aws_subnet.public_subnet[*].id
}

# output "private_subnet_ids" {
#   value       = aws_subnet.private_subnet[*].id
# }

output "vpc_default_security_group_id" {
  value = aws_vpc.this.default_security_group_id
}