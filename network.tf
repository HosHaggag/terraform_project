

module "network" {

    source = "./network"
    G1_private_subnet_cidr = var.G1_private_subnet_cidr
    G1_public_subnet_cidr = var.G1_public_subnet_cidr
    G2_private_subnet_cidr = var.G2_private_subnet_cidr
    G2_public_subnet_cidr = var.G2_public_subnet_cidr
    vpc_cidr = var.vpc_cidr
    aws_az = var.aws_az

  
}