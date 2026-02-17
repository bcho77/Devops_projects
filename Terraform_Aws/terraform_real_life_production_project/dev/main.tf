module "vpc" {
  source = "../module/network/vpc"

  name               = var.name
  vpc_cidr           = var.vpc_cidr
  azs                = var.azs
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  db_private_subnets = var.db_private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = var.tags

}