output "client_vpn_endpoint_id" {
  description = "ID do Client VPN Endpoint criado"
  value       = aws_ec2_client_vpn_endpoint.this.id
}

output "client_vpn_endpoint_dns_name" {
  description = "Nome DNS do Client VPN Endpoint"
  value       = aws_ec2_client_vpn_endpoint.this.dns_name
}

output "client_vpn_network_association_id" {
  description = "ID da associação de rede do Client VPN"
  value       = aws_ec2_client_vpn_network_association.this.id
}

output "client_vpn_route_to_internet_id" {
  description = "ID da rota criada para a Internet"
  value       = aws_ec2_client_vpn_route.to_internet.id
}

output "client_vpn_authorization_rule_id" {
  description = "ID da regra de autorização do Client VPN"
  value       = aws_ec2_client_vpn_authorization_rule.ingress_all.id
}

output "client_vpn_security_group_id" {
  description = "ID do grupo de segurança associado ao Client VPN"
  value       = var.security_group_id
}

output "client_vpn_public_subnet_id" {
  description = "ID da subnet pública associada ao Client VPN"
  value       = var.public_subnet_id
}

output "client_vpn_cidr_block" {
  description = "Bloco CIDR configurado para os clientes VPN"
  value       = var.client_cidr_block
}