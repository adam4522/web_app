resource "aws_internet_gateway" "vpc_a_igw" {
  vpc_id = aws_vpc.vpc_a.id

  tags = {
    Name = "vpc_a_igw"
  }
}

#################################################

