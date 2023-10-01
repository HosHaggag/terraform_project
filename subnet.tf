
data "aws_availability_zones" "available" {}


resource "aws_subnet" "public-G1" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.G1_public_subnet_cidr
  availability_zone= var.aws_az[0]


  tags = {
    Name = "public-G1"
  }
}

resource "aws_subnet" "public-G2" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.G2_public_subnet_cidr
  availability_zone= var.aws_az[1]


  tags = {
    Name = "public-G2"
  }
}

resource "aws_subnet" "private-G1" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.G1_private_subnet_cidr
  availability_zone= var.aws_az[0]


  tags = {
    Name = "private-G1"
  }
}

resource "aws_subnet" "private-G2" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.G2_private_subnet_cidr
  availability_zone= var.aws_az[1]


  tags = {
    Name = "private-G2"
  }
}