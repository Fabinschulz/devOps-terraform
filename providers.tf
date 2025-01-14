terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "AdministratorAccess-994954129201"
}
