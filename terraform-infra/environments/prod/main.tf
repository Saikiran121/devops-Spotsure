module "vpc" {
  source = "../../modules/vpc"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  single_nat_gateway   = var.single_nat_gateway
}

module "security" {
  source = "../../modules/security"

  project_name  = var.project_name
  vpc_id        = module.vpc.vpc_id
  key_pair_name = var.key_pair_name
  admin_cidr    = var.admin_cidr
}

module "alb" {
  source = "../../modules/alb"

  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
  certificate_arn   = var.existing_certificate_arn
}

module "redis" {
  source = "../../modules/redis"

  project_name       = var.project_name
  enable_redis       = var.enable_redis
  node_type          = var.redis_node_type
  private_subnet_ids = module.vpc.private_subnet_ids
  redis_sg_id        = module.security.redis_sg_id
}

module "asg" {
  source = "../../modules/asg"

  project_name              = var.project_name
  instance_type             = var.instance_type
  key_pair_name             = var.key_pair_name
  app_sg_id                 = module.security.app_sg_id
  private_subnet_ids        = module.vpc.private_subnet_ids
  target_group_arn          = module.alb.target_group_arn
  asg_min_size              = var.asg_min_size
  asg_desired_capacity      = var.asg_desired_capacity
  asg_max_size              = var.asg_max_size
  cpu_target_tracking_value = var.cpu_target_tracking_value
  git_repo_url              = var.git_repo_url
  git_branch                = var.git_branch
  redis_endpoint            = module.redis.primary_endpoint
}
