

variable "name"{
   description = "VPC name prefix"
   type =  string
}

# 'variable "aws_region"{
#     description = "The region to host the infrastructure"
#     type = string
   
# }

# variable "aws_vpc"{
#     description = "AWS vpc"
#     type = string
# }'

variable "vpc_cidr_block"{
   description = "VPC Classless Inter-Domain Routing Block"
   type = string
}

variable "azs" {
    description = "Availibility zones"
    type = list(string)
}

variable "public_subnets"{
    description = "Public subnet CIDRs"
    type = list(string)
}

variable "private_subnets"{
    description = "Private subnet CIDRs"
    type = list(string)
}

# variable "db_subnets"{
#     description = "Database subnet CIRDs"
#     type = list(string)
# }

variable "enable_nat_gateway"{
    description = "Enable NAT gateways per AZ"
    type = bool
    default = true
}

variable "single_nat_gateway"{
    description = "Use a single NAT gateways"
    type = bool
    default = false
}

variable "tags" {
    description = "Common tags"
    type = map(string)
    default = {}
}

