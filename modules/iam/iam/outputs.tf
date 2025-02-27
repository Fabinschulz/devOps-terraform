output "iam_access_key" {
  description = "Chave de acesso do usuário IAM"
  value       = aws_iam_access_key.this.id
}

output "iam_secret_key" {
  description = "Chave secreta do usuário IAM"
  value       = aws_iam_access_key.this.secret
  sensitive   = true
}

output "role_arn" {
  description = "ARN da Role criada"
  value       = aws_iam_role.this.arn
}