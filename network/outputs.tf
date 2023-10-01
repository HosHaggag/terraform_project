output main_vpc {
value = aws_vpc.main_vpc
}

output public-G1 {
value = aws_subnet.public-G1
}

output public-G2 {
value = aws_subnet.public-G2
}

output private-G1 {
value = aws_subnet.private-G1
}

output private-G2 {
value = aws_subnet.private-G2
}