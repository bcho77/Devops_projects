resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-igw"
  }
  
}

resource "aws_subnet" "public" {

  count = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = true
   tags = {
        Name = "terraform-public-subnet-${count.index}"
    }
}

resource "aws_subnet" "private" {
    count = 2
    vpc_id            = aws_vpc.main.id
    cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 2)
    availability_zone = element(var.azs, count.index)

    tags = {
        Name = "terraform-private-subnet-${count.index}"
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "public" {
    count          = 2
    subnet_id      = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.public.id
}