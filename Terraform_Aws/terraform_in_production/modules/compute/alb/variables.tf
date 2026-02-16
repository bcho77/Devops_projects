variable "name"{
    description = "ALB name"
    type = string
}

variable "vpc_id"{
    description = "VPC Id"
    type = string
}

variable "subnet_ids"{
    description = "Public subner Ids for ALB"
    type = list(string)
}

variable "security_group_ids" {
    description = "Security groups attached to the ALB"
    type = list(string)
      
}

variable "internal" {
    description = "Whether the ALB is internal"
    type = bool
    default = false
  
}
variable "target_port"{
    description = "Port the target groupp listens on"
    type = number
    default = 80
}

variable "target_protocol" {
    description = "Protocol for target group"
    type = string
    default = "HTTP"
  
}

variable "health_check_path" {
    description = "Health check path"
    type = string
    default = "/"
  
}

variable "tags"{
    description = "Tags"
    type = map(string)
    default = {
    }
}