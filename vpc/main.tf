# resource "aws_vpc" "main" {
#   cidr_block = var.vpc_cidr

#   tags = {
#     Name = "${var.env}-${var.project-name}-vpc"
#   }
# }

# resource "aws_subnet" "public_subnets" {
#   count             = length(var.public_subnet_cidrs)
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.public_subnet_cidrs[count.index]
#   availability_zone = var.azs[count.index]
#   tags = {
#     Name = "${var.env}-${var.project-name}-public-subnet-${count.index + 1}"
#   }
# }

# resource "aws_subnet" "private_subnets" {
#   count             = length(var.private_subnet_cidrs)
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.private_subnet_cidrs[count.index]
#   availability_zone = var.azs[count.index]
#   tags = {
#     Name = "${var.env}-${var.project-name}-private-subnet-${count.index + 1}"
#   }
# }

# resource "aws_subnet" "database_subnets" {
#   count             = length(var.database_subnet_cidrs)
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.database_subnet_cidrs[count.index]
#   availability_zone = var.azs[count.index]
#   tags = {
#     Name = "${var.env}-${var.project-name}-database-subnet-${count.index + 1}"
#   }
# }

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "${var.env}-${var.project-name}-igw"
#   }
# }


# # resource "aws_eip" "eip" {
# #   domain = "vpc" 
# #   tags = {
# #     Name = "${var.env}-${var.project-name}-ngw"
# #   }
# # }

# # resource "aws_nat_gateway" "ngw" {
# #   allocation_id = aws_eip.ngw.id
# #   subnet_id     = aws_subnet.public_subnets[0].id

# #   tags = {
# #     Name = "${var.env}-${var.project-name}-ngw"
# #   }
# # }

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id

#   # Route to allow access to the default VPC CIDR via the VPC peering connection
#   route {
#     cidr_block                = var.default_vpc_cidr
#     vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
#   }

#   # Route to allow internet access via the internet gateway
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "${var.env}-${var.project-name}-public"
#   }
# }

# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id # replace aws_nat_gateway.ngw.id
#   }

#   tags = {
#     Name = "${var.env}-${var.project-name}-private"
#   }
# }

# resource "aws_route_table" "database" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id # replace aws_nat_gateway.ngw.id
#   }

#   tags = {
#     Name = "${var.env}-${var.project-name}-database"
#   }
# }
# resource "aws_route_table_association" "public" {
#   count          = length(var.public_subnet_cidrs)
#   subnet_id      = aws_subnet.public_subnets[count.index].id
#   route_table_id = aws_route_table.public.id
# }
# resource "aws_route_table_association" "private" {
#   count          = length(var.private_subnet_cidrs)
#   subnet_id      = aws_subnet.private_subnets[count.index].id
#   route_table_id = aws_route_table.private.id
# }
# resource "aws_route_table_association" "database" {
#   count          = length(var.database_subnet_cidrs)
#   subnet_id      = aws_subnet.database_subnets[count.index].id
#   route_table_id = aws_route_table.database.id
# }


# resource "aws_vpc_peering_connection" "peering" {
#   peer_owner_id = var.account_no     #account_no
#   peer_vpc_id   = var.default_vpc_id #default_vpc_id
#   vpc_id        = aws_vpc.main.id
#   auto_accept   = true
#   tags = {
#     Name = "peering-from-default-vpc-to-${var.env}-vpc"
#   }
# }

# resource "aws_route" "default-route-table" {
#   route_table_id            = var.default_route_table_id
#   destination_cidr_block    = var.vpc_cidr
#   vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
# }

#############
# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.env}-${var.project-name}-vpc"
  }
}

# Subnets
resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  tags = {
    Name = "${var.env}-${var.project-name}-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  tags = {
    Name = "${var.env}-${var.project-name}-private-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "database_subnets" {
  count             = length(var.database_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.database_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  tags = {
    Name = "${var.env}-${var.project-name}-database-subnet-${count.index + 1}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.env}-${var.project-name}-igw"
  }
}

# Route Tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
 
 # Route to allow access to the default VPC CIDR via the VPC peering connection
  route {
    cidr_block                = var.default_vpc_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  }

  # Route to allow internet access via the internet gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env}-${var.project-name}-public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id # replace with NAT Gateway if needed
  }

  tags = {
    Name = "${var.env}-${var.project-name}-private"
  }
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id # replace with NAT Gateway if needed
  }

  tags = {
    Name = "${var.env}-${var.project-name}-database"
  }
}

# Route Table Associations
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "database" {
  count          = length(var.database_subnet_cidrs)
  subnet_id      = aws_subnet.database_subnets[count.index].id
  route_table_id = aws_route_table.database.id
}

# VPC Peering Connection
resource "aws_vpc_peering_connection" "peering" {
  peer_owner_id = var.account_no
  peer_vpc_id   = var.default_vpc_id
  vpc_id        = aws_vpc.main.id
  auto_accept   = true

  tags = {
    Name = "peering-from-default-vpc-to-${var.env}-vpc"
  }
}

# Route for default VPC to reach new VPC via peering
resource "aws_route" "default-route-table" {
  route_table_id            = var.default_route_table_id
  destination_cidr_block    = var.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}
