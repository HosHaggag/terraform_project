

# Networking
# 1- create vpc
# 2- create internet gateway
# 3- create public route table
# 4- create private route table
# 5- create public route
# 6- attach public route table to subnets
# Compute
# 7- create security group which allow ssh from 0.0.0.0/0
# 8- create security group that allow ssh and port 3000 from vpc cidr only
# 7- create ec2(bastion) in public subnet with security group from 7
# 8- create ec2(application) private subnet with security group from 8


resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "main_vpc"
  }
}
