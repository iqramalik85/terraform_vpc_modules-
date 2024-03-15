resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public" {
  count                  = length(var.availability_zones)
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.cidr_public_subnet[count.index]
  availability_zone      = var.availability_zones[count.index]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count                  = length(var.availability_zones)
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.cidr_private_subnet[count.index]
  availability_zone      = var.availability_zones[count.index]
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "public_association" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
