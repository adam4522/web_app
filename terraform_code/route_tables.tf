#route table and routes created for public subnets to internet gw for vpc a

resource "aws_route_table" "vpc_a_publicrt" {
  vpc_id = aws_vpc.vpc_a.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_a_igw.id
  }

  tags = {
    Name = "vpc_a_publicrt"
  }
}

resource "aws_route_table_association" "vpc_a__public_az1" {
  subnet_id      = aws_subnet.vpc_a_subnet_public_AZ1.id
  route_table_id = aws_route_table.vpc_a_publicrt.id
}

