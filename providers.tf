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

provider "aws" {
  region  = var.aws_region
}

# Cria o bucket para armazenar o estado do terraform no S3
resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_state

  lifecycle {
    prevent_destroy = true // Previne a exclusão do bucket
  }
}

// Configura o versionamento do bucket para armazenar o estado do terraform
// É util para manter versões anteriores do estado do terraform
resource "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [aws_s3_bucket.tf_state]
}