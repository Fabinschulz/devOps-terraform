# module "s3" {
#   source         = "./modules/s3"
#   s3_bucket_name = "synthra-bucket-iac"
#   s3_tags = {
#     Iac = true
#   }
# }

# module "cloudfront" {
#   source             = "./modules/cloudfront"
#   origin_id          = module.s3.bucket_id
#   bucket_domain_name = module.s3.bucket_domain_name
#   cdn_price_class    = "PriceClass_200"
#   cdn_tags = {
#     Iac = true
#   }
#   depends_on = [module.s3]
# }

module "function" {
  source = "./modules/iam/function"

  role_name             = "ec2-elastic-beanstalk-role"
  instance_profile_name = "ec2-elastic-beanstalk-profile"
}

module "iam" {
  source = "./modules/iam/iam"

  role_name   = var.redis_role_name
  policy_name = var.redis_policy_name
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs
  availability_zones    = var.availability_zones
}

module "redis" {
  source                                    = "./modules/redis"
  vpc_id                                    = module.vpc.vpc_id
  subnet_ids                                = module.vpc.public_subnet_ids
  sg_ingress_rule_source_security_group_ids = [module.vpc.vpc_default_security_group_id]
  my_ip                                     = chomp(data.http.my_ip.response_body)
}

# module "ec2" {
#   count  = 1
#   source = "./modules/ec2"

#   # Argumentos obrigatórios ARNs dos Certificados
#   server_certificate_arn     = ""
#   client_cidr_block          = ""
#   root_certificate_chain_arn = ""

#   # vpc_id            = module.vpc.vpc_id
#   # public_subnet_id  = module.vpc.public_subnet_ids[0]
#   # security_group_id = module.vpc.vpc_default_security_group_id
# }