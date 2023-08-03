#creating variables in a string
#region and vpc name
variable "region" {
  description = "aws region"
  default     = "eu-west-2"
}

variable "vpc_name" {
  description = "vpc name"
  default     = "vpc_prac"
}


#cidr_block variables for each subnet
variable "cidr_block_1" {
  description = "public_cidr_block_subnet_1"
  default     = "10.0.1.0/26"
}

variable "cidr_block_2" {
  description = "public_cidr_block_subnet_2"
  default     = "10.0.2.0/26"
}

variable "cidr_block_3" {
  description = "private_cidr_block_subnet_3"
  default     = "10.0.3.0/26"
}

variable "cidr_block_4" {
  description = "private_cidr_block_subnet_4"
  default     = "10.0.4.0/26"
}

