output "vpc_id" {
  description = "ID of the provisioned VPC"
  value       = aws_vpc.main_vpc.id
}

output "vpc_cidr" {
  description = "CIDR of the overall environment config (covering all subnets)"
  value       = var.vpc_cidr
}

output "public_subnet_ids" {
  description = "List of public subnet IDs provisioned"
  value       = aws_subnet.public_subnets.*.id
}

output "public_subnet_cidrs" {
  description = "List of public subnet cidr blocks provisioned"
  value       = var.public_subnet_cidrs
}

output "private_subnet_ids" {
  description = "List of private subnet IDs provisioned"
  value       = aws_subnet.private_subnets.*.id
}

output "private_subnet_cidrs" {
  description = "List of private subnet cidr blocks provisioned"
  value       = var.private_subnet_cidrs
}
