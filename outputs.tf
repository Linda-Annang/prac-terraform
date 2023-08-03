# to get the id and cidr block of vpc
output "vpc_id" {
  value = aws_vpc.vpc_prac.id
}

output "vpc_cidr_block" {
  value = aws_vpc.vpc_prac.cidr_block
}

#to get the id(s) of subnets
output "subnet_id_1" {
  value = aws_subnet.prac-sub-1.id
}

output "subnet_id_2" {
  value = aws_subnet.prac-sub-2.id
}

output "subnet_id_3" {
  value = aws_subnet.prac-sub-3.id
}

output "subnet_id_4" {
  value = aws_subnet.prac-sub-4.id
}



