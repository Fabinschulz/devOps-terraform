# Criação do Client VPN Endpoint
resource "aws_ec2_client_vpn_endpoint" "this" {
  description            = "terraform-client-vpn"
  server_certificate_arn = var.server_certificate_arn
  client_cidr_block      = var.client_cidr_block

  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = var.root_certificate_chain_arn
  }

  connection_log_options {
    enabled = false
  }

  security_group_ids = [var.security_group_id]
  vpc_id             = var.vpc_id
}

# Associação da Subnet ao Client VPN Endpoint
resource "aws_ec2_client_vpn_network_association" "this" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  subnet_id              = var.public_subnet_id
}

# Criação de uma Rota para a Internet
resource "aws_ec2_client_vpn_route" "to_internet" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  destination_cidr_block = "0.0.0.0/0"
  target_vpc_subnet_id   = var.public_subnet_id
}

# Regra de Autorização para Permitir Todo o Tráfego
resource "aws_ec2_client_vpn_authorization_rule" "ingress_all" {
  target_network_cidr    = "0.0.0.0/0"
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  authorize_all_groups   = true
}