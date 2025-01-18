variable "bucket_state" {
  type        = string
  default     = "synthra-state-stg"
  description = "Bucket name for the state file"
}

# AWS Region
variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "Region in which AWS Resources to be created"
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "stg"
}