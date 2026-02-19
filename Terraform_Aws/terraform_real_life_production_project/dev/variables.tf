
######################### VPC variables #################

variable "aws_region" {
  description = "Region where  our Insfrastrutures are deploy"
  type        = string
}
variable "name" {
  description = "VPC name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC cidr for the segmentation of the network"
  type        = string

}

variable "public_subnets" {

  description = "public subnets for the VPC"
  type        = list(string)

}


variable "private_subnets" {

  description = "private subnets for the VPC"
  type        = list(string)

}

variable "db_private_subnets" {

  description = "private subnets for the RDS database"
  type        = list(string)

}

variable "azs" {
  description = "availability zones for the VPC"
  type        = list(string)

}

# variable "enable_nat_gateway" {
#     description = "flag to enable or disable NAT Gateway"
#     type = bool
#     default = false
# }

# variable "single_nat_gateway" {
#     description = "flag to determine if a single NAT Gateway should be used across all AZs"
#     type = bool
#     default = true
# }

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

########### ALB Variables ##################


variable "internal" {
  description = "Whether the ALB is internal"
  type        = bool
  default     = false
}

variable "target_port" {
  description = "Port the target groupp listens on"
  type        = string
}

variable "target_protocol" {
  description = "Protocol for target group"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}