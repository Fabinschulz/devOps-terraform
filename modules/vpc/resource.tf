/**** The VPC *******/
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.environment}-vpc"
  }
}

/**** Subnets *******/

/* Internet gateway used by a public subnet */
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.environment}-igw"
  }
}

/*********** Public subnet *********/
resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.this.id
  cidr_block                = var.public_subnet_cidrs[count.index]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-public-subnet-${element(var.availability_zones, count.index)}"
  }
}

/********* Private subnet ***********/
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.this.id
  count                   = length(var.private_subnets_cidrs)
  cidr_block              = element(var.private_subnets_cidrs, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.name}--private-subnet-${element(var.availability_zones, count.index)}"
  }
}


/******* Routing table for public subnet **********/
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
 
  tags = {
    Name = "${var.environment}-public-rt"
  }
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}


/******* Routing table for private subnet **********/
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-private-rt"
  }
}

resource "aws_route" "private_nat_gateway" {
  count                  = var.enable_nat_gw ? 1 : 0
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[0].id
}


/****** Route table associations ********/
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets_cidrs)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private.id
}


/***************** NAT *******************/
# Use a public NAT gateway to enable instances in a private subnet to send outbound traffic to the internet,
# while preventing the internet from establishing connections to the instances.
resource "aws_nat_gateway" "nat" {
  count         = var.enable_nat_gw ? 1 : 0
  subnet_id      = aws_subnet.public_subnet[count.index].id
  allocation_id = aws_eip.nat_eip[0].id
  tags = {
    Name = "${var.name}-nat-gateway"
  }
}

resource "aws_eip" "nat_eip" {
  count  = var.enable_nat_gw ? 1 : 0
  domain = "vpc"
}