output "role_arn" {
  description = "ARN da Role criada"
  value       = aws_iam_role.redis_access_role.arn
}