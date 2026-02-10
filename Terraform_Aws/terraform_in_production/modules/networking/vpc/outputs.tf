output "vpc_id"{
    value = aws_vpc.My_vpc.id
}

output "public_subnet_ids"{
    value = aws_subnet.Public[*].id
}

output "private_subnet_ids"{
    value = aws_subnet.Public[*].id
}

