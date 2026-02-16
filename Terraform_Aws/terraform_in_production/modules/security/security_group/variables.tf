variable "name"{
    description = "Security group name"
    type = string
}

variable "description" {
    description = "Security group description"
    type = string
  
}

variable "vpc_id" {
    description = "VPC where the security group is created"
    type = string
  
}

variable "ingress_rules"{
    description = "List of ingress rules"
    type = list(object({
      description = string
      from_port = number
      to_port = number
      protocol = string
      cidr_blocks = list(string)
    }))

    default = [ {
      
    } ]
}

variable "egress_rules" {
    description = "List of ingress rules"
    type = list(object({
      description = string
      from_port = number
      to_port = number
      protocol = string
      cidr_blocks = list(string)
    }))

    default = [ {
      
    } ]
  
}

variable "tags" {
    description = "Tags for the security group"
    type = map(string)
    default = {
      
    }
  
}