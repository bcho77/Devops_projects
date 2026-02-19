variable "name"{
    description = "ASG name"
    type = string
}

variable "ami_id" {
    description = "Amazon image Id to use"
    type = string
  
}

variable "instance_type" {
    description = "Type on image"
    type = string
  
}

variable "subnet_ids"{
    description = "Subnets where the Ec2 reside"
    type = list(string)
}

variable "min_size" {
    type = number
    default = 1
  
}

variable "max_size" {
    type = number
    default = 3
  

}

variable "desired_capacity" {
    type = number
    default = 1
      
}

variable "security_group_ids" {
    type = list(string)
  
}

variable "target_group_arns" {
    description = "Optional ALB target groups"
    type = list(string)
    default = [ "" ]
  
}

variable "cpu_target_value" {
    description = "Target CPU utilization %"
    type = number
    default = 50
  
}