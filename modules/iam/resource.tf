# Criação do IAM User
resource "aws_iam_user" "this" {
  name = var.user_name
}

# Criação do IAM Access Key
resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

# Criação da IAM Policy para ElastiCache
resource "aws_iam_policy" "this" {
  name        = var.policy_name
  description = "Política para permitir conexão ao ElastiCache com autenticação IAM"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "elasticache:Connect",
          "elasticache:Describe*",
          "elasticache:List*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Associação da IAM Policy ao IAM User
resource "aws_iam_user_policy_attachment" "this" {
  user       = aws_iam_user.this.name
  policy_arn = aws_iam_policy.this.arn
}

# Criação da IAM Role para ElastiCache
resource "aws_iam_role" "this" {
  name = var.role_name
  path = "/"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "elasticache.amazonaws.com"
        }
      }
    ]
  })
}

# Criação da IAM Role Policy (substitui o inline_policy)
resource "aws_iam_role_policy" "assume_elasticache_role" {
  name = "AssumeElastiCacheRole"
  role = aws_iam_role.this.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "sts:AssumeRole"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Associação da IAM Policy à IAM Role
resource "aws_iam_role_policy_attachment" "redis_access_attach" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}