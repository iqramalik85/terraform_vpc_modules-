variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}



variable "cidr_public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
}