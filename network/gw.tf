
resource "aws_nat_gateway" "ng" {
  subnet_id         = aws_subnet.public-G1.id
  allocation_id     = aws_eip.eip_ng.id

  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_eip" "eip_ng" {

  tags = {
    Name = "main"
  }
}