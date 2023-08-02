resource "aws_vpc" "vpc_prac" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc_prac"
  }
}

resource "aws_subnet" "prac-sub-1" {
  vpc_id     = aws_vpc.vpc_prac.id
  cidr_block = "10.0.1.0/26"

  tags = {
    Name = "prac-sub-1"
  }
}


resource "aws_subnet" "prac-sub-2" {
  vpc_id     = aws_vpc.vpc_prac.id
  cidr_block = "10.0.2.0/26"

  tags = {
    Name = "prac-sub-2"
  }
}

resource "aws_subnet" "prac-sub-3" {
  vpc_id     = aws_vpc.vpc_prac.id
  cidr_block = "10.0.3.0/26"

  tags = {
    Name = "prac-sub-3"
  }
}

resource "aws_subnet" "prac-sub-4" {
  vpc_id     = aws_vpc.vpc_prac.id
  cidr_block = "10.0.4.0/26"

  tags = {
    Name = "prac-sub-4"
  }
}

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

resource "aws_internet_gateway" "prac-igw" {
  vpc_id = aws_vpc.vpc_prac.id

  tags = {
    Name = "prac-igw"
  }
}


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

resource "aws_route" "public-igw-route" {
  route_table_id            = aws_route_table.public-rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.prac-igw.id
}

