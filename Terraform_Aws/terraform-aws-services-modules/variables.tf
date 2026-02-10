### VPC VARIABLES ###

variable "aws_region" {
    description = " Aws region"
    type = string

}

variable "azs" {
  type = list(string)
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "VPC name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}


variable "public_subnets" {
  description = " Public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = " Privat subnet CIDRs"
  type        = list(string)
}

###### EC2 VARIABLES ######

variable "ami"{
    type = string
}

variable "instance_type" {
    type = string
}

variable "subnet_id"{
    type = string
}

variable "vpc_id"{
    type = string
}

variable "associate_public_ip" {
    type = bool
    default = false
}

