module "vpc" {
  source = "../module/network/vpc"

  name               = "${var.name}-vpc"
  vpc_cidr           = var.vpc_cidr
  azs                = var.azs
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  db_private_subnets = var.db_private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = var.tags

}

module "alb" {
  source = "../module/compute/alb"

  name              = "${var.name}-alb"
  vpc_id            = module.vpc.id
  subnet_ids        = module.vpc.public_subnet_ids
  target_port       = var.target_port
  target_protocol   = var.target_protocol
  health_check_path = var.health_check_path
  internal          = var.internal
  tags              = var.tags
  
}