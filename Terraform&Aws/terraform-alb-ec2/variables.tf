variable "aws_region" {
    description = "The AWS region to deploy resources in"
    type        = string
    default     = "us-east-1"
}

variable "ami_id" {
    description = "The AMI ID for the EC2 instance"
    type        = string
    default     = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  
}

variable "instance_type" {
    description = "The EC2 instance type"
    type        = string
    default     = "t2.micro"
}

variable "azs" {
    description = "List of availability zones"
    type        = list(string)
    default     = ["us-east-1a", "us-east-1b"]
  
}