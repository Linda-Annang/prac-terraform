# creating vpc
resource "aws_vpc" "vpc_prac" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}
#provisioning 4 subnets with different cidr block specifications
resource "aws_subnet" "prac-sub-1" {
  vpc_id     = aws_vpc.vpc_prac.id
  cidr_block = var.cidr_block_1

  tags = {
    Name = "prac-sub-1"
  }
}


resource "aws_subnet" "prac-sub-2" {
  vpc_id     = aws_vpc.vpc_prac.id
  cidr_block = var.cidr_block_2

  tags = {
    Name = "prac-sub-2"
  }
}

resource "aws_subnet" "prac-sub-3" {
  vpc_id     = aws_vpc.vpc_prac.id
  cidr_block = var.cidr_block_3

  tags = {
    Name = "prac-sub-3"
  }
}

resource "aws_subnet" "prac-sub-4" {
  vpc_id     = aws_vpc.vpc_prac.id
  cidr_block = var.cidr_block_4

  tags = {
    Name = "prac-sub-4"
  }
}

#provisioning  2 route table for public and private traffic/commun
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc_prac.id

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc_prac.id

  tags = {
    Name = "private-rt"
  }
}

#internet gateway provision
resource "aws_internet_gateway" "prac-igw" {
  vpc_id = aws_vpc.vpc_prac.id

  tags = {
    Name = "prac-igw"
  }
}

# route table association with the subnets, 2 subnets to each route table
resource "aws_route_table_association" "public-rta-a" {
  subnet_id      = aws_subnet.prac-sub-1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public-rta-b" {
  subnet_id      = aws_subnet.prac-sub-2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private-rta-a" {
  subnet_id      = aws_subnet.prac-sub-3.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private-rta-b" {
  subnet_id      = aws_subnet.prac-sub-4.id
  route_table_id = aws_route_table.private-rt.id
}

# internet gateway route association to route table
resource "aws_route" "public-igw-route" {
  route_table_id            = aws_route_table.public-rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.prac-igw.id
}

