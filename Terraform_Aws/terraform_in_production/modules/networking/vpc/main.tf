
######## VPC resource #######################

resource "aws_vpc" "My_vpc"{
    cidr_block = var.vpc_cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = merge(
        local.common_tags,{
            
            Name = "${var.name}-vpc"
          
        }
    )
}

######## Internet Gateway #######################

resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.My_vpc.id

    tags = merge(
        local.common_tags, {

            Name = "${var.name}-igw"
        }
    )
}

######## Public subnet #######################

resource "aws_subnet" "Public"{
    count = length(var.public_subnets)
    vpc_id = aws_vpc.My_vpc.id
    cidr_block = var.public_subnets[count.index]
    availability_zone = var.azs[count.index]
    map_public_ip_on_launch = true
    

    tags = merge(
        local.common_tags, {
            Name = "${var.name}-public_subnets - ${var.azs[count.index]}"
            Tier = "public"
        }
    )
}


######## Private subnet #######################

resource "aws_subnet" "Private"{
    count = length(var.private_subnets)
    vpc_id = aws_vpc.My_vpc.id
    cidr_block = var.private_subnets[count.index]
    availability_zone = var.azs[count.index]

    tags = merge(
        local.common_tags, {
            Name = "${var.name}-private_subnets - ${var.azs[count.index]}"
            Tier = "private"
        }
    )
}

######## Database subnet #######################

# resource "aws_subnet" "database"{
#     count = length(var.private_subnets)
#     vpc_id = aws_vpc.My_vpc.id
#     cidr_block = var.private_subnets[count.index]
#     availability_zone = var.azs[count.index]

#     tags = merge(
#         local.common_tags, {
#             Name = "${var.name}-db_subnets - ${var.azs[count.index]}"
#             Tier = "Database"
#         }
#     )

# }

######## Elastisk Ip Address #######################
resource "aws_eip" "epi"{
    count = local.nat_gateway_count
    domain = "vpc"

    tags = merge(
        local.common_tags, {
            Name = "${var.name}-epi-${count.index}"
        }
    )
}

######## NAT gateway #######################

resource "aws_nat_gateway" "nat"{

    depends_on = [ aws_internet_gateway.igw ]

    count = local.nat_gateway_count
    allocation_id = aws_eip.epi[count.index].id
    subnet_id = aws_subnet.Public[var.single_nat_gateway ? 0 : count.index].id

    tags = merge(
        local.common_tags, {
            Name = "${var.name}-nat-${count.index}"
        }
    )
}


########### Routes tables Internet Gateway ##############


resource "aws_route_table" "public_r_t"{
    vpc_id =  aws_vpc.My_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags =  merge(
        local.common_tags, {
            Name = "${var.name}-public_r_t"
        }
    )
}

############ Association to a public subnet ###########

resource "aws_route_table_association" "public_ass" {
    route_table_id =  aws_route_table.public_r_t.id

    count = length(aws_subnet.Public)

    subnet_id =  aws_subnet.Public[count.index].id

}


########### Routes tables NAT Gateway ##############

resource "aws_route_table" "private_r_t" {

    vpc_id = aws_vpc.My_vpc.id

    count = local.nat_gateway_count

    route {
        cidr_block = "0.0.0.0/0"

        nat_gateway_id = aws_nat_gateway.nat[count.index].id

    }

    tags = merge(
        local.common_tags,{
            Name = "$(var.name)-private-rt-${count.index}"
        }
    )
    
}

################## Route table association ##############

resource "aws_route_table_association" "private" {
    route_table_id =  aws_route_table.private_r_t[var.single_nat_gateway ? 0 : count.index].id
    

    count = length(aws_subnet.Private)
    subnet_id = aws_subnet.Private[count.index].id 

}
