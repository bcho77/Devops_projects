variable "name"{
    description = "ASG name"
    type = string
}

variable "ami_id" {
    description = "AMI Id for instances"
    type =  string
  
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
  
}

variable "subnet_ids"{
    description = "Private subnet IDs"
    type = list(string)

}

variable "security_group_ids" {
    description = "Security groups for instances"
    type = list(string)
}

variable "target_group_arns" {

    description = "ALB target group ARNs"
    type = list(string)
  
}

variable "desired_capacity" {
    type = number
  
}

variable "min_size" {
    type = number
  
}

variable "max_size"{
    type = number
}

# variable "user_data"{
#     description = "User data script"
#     type = string
#     default = "null"
# }

variable "tags"{
    type = map(string)
    default = {
      
    }
}