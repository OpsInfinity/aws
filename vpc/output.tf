output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnets[*].id
}

output "database_subnet_ids" {
  value = aws_subnet.database_subnets[*].id
}

output "vpc_id" {
  value = aws_vpc.main.id
}
