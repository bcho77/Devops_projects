

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


# name = "dev"

# vpc_cidr_block = "10.0.0.0/16"

# azs = [
#   "us-east-1a",
#   "us-east-1b"
# ]

# public_subnets = [
#   "10.0.1.0/24",
#   "10.0.2.0/24"
# ]

# private_subnets = [
#   "10.0.11.0/24",
#   "10.0.12.0/24"
# ]





# tags = {
#   Environment = "dev"
#   ManagedBy   = "terraform"
# }

}
