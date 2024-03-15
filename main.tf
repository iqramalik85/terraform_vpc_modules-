provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
  
  vpc_cidr_block        = var.vpc_cidr_block
  cidr_public_subnet    = var.cidr_public_subnet
  cidr_private_subnet   = var.cidr_private_subnet
  availability_zones    = var.availability_zones
}
