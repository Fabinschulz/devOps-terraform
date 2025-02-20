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

  user_name       = var.user_name
  policy_name     = var.policy_name
  policy_document = var.policy_document
}

module "redis_role" {
  source = "./modules/redis_role"

  role_name   = var.redis_role_name
  policy_name = var.redis_policy_name
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
  environment         = var.environment
}

module "redis" {
  source = "./modules/redis"

  cluster_id                = var.redis_cluster_id
  node_type                 = var.redis_node_type
  num_cache_nodes           = var.redis_num_cache_nodes
  parameter_group_name      = var.redis_parameter_group_name
  engine_version            = var.redis_engine_version
  port                      = var.redis_port
  vpc_id                    = module.vpc.vpc_id
  allowed_cidr_blocks       = var.allowed_cidr_blocks
  subnet_group_name         = var.redis_subnet_group_name
  subnet_ids                = module.vpc.public_subnet_ids
  snapshot_retention_limit  = var.redis_snapshot_retention_limit
  maintenance_window        = var.redis_maintenance_window
}