module "vpc" {
    source = "./module/vpc"

    name = var.name
    vpc_cidr         = var.vpc_cidr
    azs              = var.azs
    public_subnets   = var.public_subnets  
    private_subnets  = var.private_subnets
    tags             = var.tags
}

module "public_ec2"{
    source = "./module/ec2"
    name = var.name
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = module.vpc.public_subnets[0]
    vpc_id = module.vpc.vpc_id
    associate_public_ip = true
}

module "private_ec2"{
    source = "./module/ec2"
    name = "${var.name}-private"
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = module.vpc.private_subnets[0]
    vpc_id = module.vpc.vpc_id
    associate_public_ip = false
}