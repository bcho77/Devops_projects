
####### VPC Module ################

module "vpc" {
  source = "../modules/networking/vpc"

  name            = var.name
  vpc_cidr_block    = var.vpc_cidr_block
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = var.tags


}

############### Security group module ###############


module "Security_Group"{
  source ="../modules/security/security_group"

  name = "dev-sg"
  description = " Tier security group"
  vpc_id = module.vpc.vpc_id

  ingress_rules = var.ingress_rules
  egress_rules = var.egress_rules
  tags = var.tags
}

module "Application_Load_Balancer" {
  source = "../modules/compute/alb"

  name = "dev-alb"

  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.public_subnet_ids

  security_group_ids = [ module.Security_Group.security_group_id ]

  tags = {
    Environment = "dev"
    Component = "alb"
  }
  
}

################ Autoscaling group ################################


module "Autoscaling_Group" {

source = "../modules/compute/asg"

name = "dev-asg"

ami_id = ""

instance_type = ""

subnet_ids = module.vpc.private_subnet_ids

security_group_ids = [
  module.Security_Group.security_group_id
]

target_group_arns = [ module.Application_Load_Balancer.target_group_arn]

desired_capacity = 2
min_size = 1
max_size = 4

tags = {
  Environment = "dev"
  Tier = "app"
}

}
  