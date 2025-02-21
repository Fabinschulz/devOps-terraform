module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = "synthra-bucket-iac"
  s3_tags = {
    Iac = true
  }
}

module "cloudfront" {
  source             = "./modules/cloudfront"
  origin_id          = module.s3.bucket_id
  bucket_domain_name = module.s3.bucket_domain_name
  cdn_price_class    = "PriceClass_200"
  cdn_tags = {
    Iac = true
  }
  depends_on = [module.s3]
}

module "iam" {
  source = "./modules/iam"

  role_name   = var.redis_role_name
  policy_name = var.redis_policy_name
}

module "vpc" {
  source = "./modules/vpc"
}

module "redis" {
  source     = "./modules/redis"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
}