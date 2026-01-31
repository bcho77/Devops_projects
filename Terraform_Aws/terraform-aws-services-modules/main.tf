module "vpc" {
    source = "./module/vpc"

    name = var.name
    vpc_cidr         = var.vpc_cidr
    azs              = var.azs
    public_subnets   = var.public_subnets  
    private_subnets  = var.private_subnets
    tags             = var.tags
}