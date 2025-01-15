terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
  # backend "s3" {
  #   bucket  = "synthra-state-stg"
  #   region  = "us-east-2"
  #   key     = "terraform.tfstate"
  #   encrypt = true
  # }
}

provider "aws" {}

resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_state

  lifecycle {
    prevent_destroy = true // Previne a exclusão do bucket
  }
}

resource "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [aws_s3_bucket.tf_state]
}