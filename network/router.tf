

resource "aws_route_table" "public_router" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public_router"
  }
}

resource "aws_route_table" "private_router" {
    vpc_id = aws_vpc.main_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ng.id
    }

    tags = {
        Name = "private_router"
    }

}

resource "aws_route_table_association" "G1" {
  subnet_id      = aws_subnet.public-G1.id
  route_table_id = aws_route_table.public_router.id
}

resource "aws_route_table_association" "G2" {
  subnet_id      = aws_subnet.public-G2.id
  route_table_id = aws_route_table.public_router.id
}


resource "aws_route_table_association" "G3" {
  subnet_id      = aws_subnet.private-G1.id
  route_table_id = aws_route_table.private_router.id
}

resource "aws_route_table_association" "G4" {
  subnet_id      = aws_subnet.private-G2.id
  route_table_id = aws_route_table.private_router.id
}
