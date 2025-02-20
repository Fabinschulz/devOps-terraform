variable "bucket_state" {
  type        = string
  default     = "synthra-state-stg"
  description = "Bucket name for the state file"
}

# AWS Region
variable "aws_region" {
  description = "Região da AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "stg"
}

variable "user_name" {
  description = "Nome do usuário IAM"
  type        = string
  default     = "synthra-user"
}

variable "policy_name" {
  description = "Nome da política IAM"
  type        = string
  default     = "synthra-policy"
}

variable "policy_document" {
  description = "Documento de política IAM em JSON"
  type        = string
  default     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets",
      "Resource": "*"
    }
  ]
}
EOF
}