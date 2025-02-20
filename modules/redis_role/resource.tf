resource "aws_iam_role" "redis_access_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "redis_access_policy" {
  name        = var.policy_name
  description = "Política para acesso ao Redis"
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

resource "aws_iam_role_policy_attachment" "redis_access_attach" {
  role       = aws_iam_role.redis_access_role.name
  policy_arn = aws_iam_policy.redis_access_policy.arn
}