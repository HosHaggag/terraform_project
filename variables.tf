
variable "vpc_cidr" {
  type = string
}
  

variable "G1_public_subnet_cidr" {
  type = string
}

variable "G1_private_subnet_cidr" {
  type = string
}

variable "G2_public_subnet_cidr" {
  type = string
}

variable "G2_private_subnet_cidr" {
  type = string
}
  

variable "aws_az" {
  type = list(string)
}

variable "ami_id" {
    type = string
  
}

variable "instance_type" {
    type = string
  
}

variable "aws_region" {
    type = string
  
}
  

