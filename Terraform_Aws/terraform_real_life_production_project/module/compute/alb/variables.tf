variable "name"{
    description = "ALB name"
    type = string
}

variable "vpc_id"{
    description = " VPC Id"
    type = string
}

variable "subnet_ids"{
    description = "Vpc subnets"
    type = list(string)
}

# variable "security_group_ids"{
#     description = "Security group Id"
#     type = string
# }

variable "internal"{
    description = "Whether the ALB is internal"
    type = bool
    default = false
}

variable "target_port"{
    description = "Port the target groupp listens on"
    type = string
}

variable "target_protocol"{
    description = "Protocol for target group"
    type = string
    default = "HTTP"
}

variable "health_check_path"{
    description = "Health check path"
    type = string
    default = "/"
}

variable "tags" {
    description = "Tags for the security group"
    type = map(string)
    default = {
      
    }
  
}

# variable "ingress_rules"{
#     description = "List of ingress rules"
#     type = list(object({
#       description = string
#       from_port = number
#       to_port = number
#       protocol = string
#       cidr_blocks = list(string)
#     }))

#     default = [ {
      
#     } ]
# }

# variable "egress_rules" {
#     description = "List of ingress rules"
#     type = list(object({
#       description = string
#       from_port = number
#       to_port = number
#       protocol = string
#       cidr_blocks = list(string)
#     }))

#     default = [ {
      
#     } ]
  
# }

